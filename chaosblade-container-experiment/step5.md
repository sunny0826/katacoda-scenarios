本实验通过修改本地的 hosts，篡改域名地址映射，模拟 container 内域名访问异常场景。

**实验参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `domain` | string | 域名 (必要参数) |
| `ip` | string | 映射的 ip (必要参数) |
| `timeout` | string | 设定运行时长，单位是秒，通用参数。 |

**开始实验**

获取 Pod 名称：

`echo $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade)`{{execute}}

获取 container id：

`kubectl get pod $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade) -n chaosblade -o custom-columns=CONTAINER:.status.containerStatuses[0].name,ID:.status.containerStatuses[0].containerID`{{execute}}

打开 `tamper_container_dns_by_id.yaml`{{open}} ，将 `container id` 和 `Pod 名称`贴入 `container-ids` 和 `name` 字段

执行命令，开始实验：

`kubectl apply -f tamper_container_dns_by_id.yaml`{{execute}}

**查看实验状态**

执行命令： `kubectl get blade tamper-container-dns-by-id -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

获取实验 pod ip：
`echo $(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items..status.podIP})`{{execute}}

直接从观测 pod 访问实验 pod IP：
`kubectl exec $(kubectl get pod -l app=redis,role=slave -n chaosblade -o jsonpath={.items[0]..metadata.name}) -n chaosblade -- bash -c 'ping '$(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items..status.podIP})`{{execute}}

无响应，`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

从未指定丢包的 pod 进入访问实验 pod IP：
`kubectl exec $(kubectl get pod -l app=redis,role=slave -n chaosblade -o jsonpath={.items[1]..metadata.name}) -n chaosblade -- bash -c 'ping '$(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items..status.podIP})`{{execute}}

相应正常，`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

>这里在配置中将 `timeout` 设置为 60 秒，60 秒后 100% 丢包的情况将会消失，这个配置是为了防止因丢包率设置太高，造成机器无法连接的情况。与其有相似功能的还有 `exclude-port`，该配置指定一些端口不会丢包，以免该 pod 失联。

**停止实验**

执行命令：`kubectl apply -f tamper_container_dns_by_id.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade tamper-container-dns-by-id `{{execute}}