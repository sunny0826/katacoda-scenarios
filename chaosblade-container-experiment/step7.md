此实验会挂起指定容器中的 `redis-server` 进程。

**参数**

| 参数 | 类型 | 说明 |
| --- | --- | --- |
| `process` | string | 进程关键词，会在整个命令行中查找 |
| `process-cmd` | string | 进程命令，只会在命令中查找 |
| `timeout` | string | 设定运行时长，单位是秒，通用参数|

**开始实验**

获取 Pod 名称：

`echo $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade)`{{execute}}

获取 container id：

`kubectl get pod $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade) -n chaosblade -o custom-columns=CONTAINER:.status.containerStatuses[0].name,ID:.status.containerStatuses[0].containerID`{{execute}}

打开 `stop_container_process_by_names.yaml`{{open}}，将 `container id` 和 `Pod 名称`贴入 `container-ids` 和 `name` 字段。

执行命令，开始实验：

`kubectl apply -f stop_container_process_by_names.yaml`{{execute}}

**查看实验状态**

执行命令： `kubectl get blade stop-container-process-by-names -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

进入实验 pod，查看 redis-server 进程号：

`kubectl exec $(kubectl get pod -l app=redis,role=master -n chaosblade -o jsonpath={.items[0]..metadata.name}) -n chaosblade -- bash -c 'ps aux| grep redis-server'`{{execute}}

可以看到 `redis-server` 此刻进程处于暂停状态了（T）。

**停止实验**

执行命令：`kubectl delete -f stop_container_process_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade stop-container-process-by-names`{{execute}}
