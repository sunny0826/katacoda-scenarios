删除 chaosblade 命名空间下，删除 container。

**开始实验**

获取 pod 名称：

`echo $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade)`{{execute}}

获取 container id：

`kubectl get pod $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade) -n chaosblade -o custom-columns=CONTAINER:.status.containerStatuses[0].name,ID:.status.containerStatuses[0].containerID`{{execute}}

打开 `remove_container_by_id.yaml`{{open}} ，将container id 和 pod 名称填入 `container-ids` 和 `names` 中。

开始观测实验 pod

`kubectl get pod $(kubectl get pod -l app=redis,role=master -o jsonpath={.items..metadata.name} -n chaosblade) -n chaosblade -o custom-columns=CONTAINER:.status.containerStatuses[0].name,ID:.status.containerStatuses[0].containerID -w`{{execute}}

打开新终端：
`echo "Run in Terminal 2"`{{execute T2}}

执行命令，开始实验：

`kubectl apply -f remove_container_by_id.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade remove-container-by-id -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

回到终端1，查看实验结果：

`echo "Run in Terminal 1"`{{execute T1}}

可以看到容器ID发生了变化，旧容器被删除了，拉起了新容器。

结束观测：
`echo "Send Ctrl+C before running Terminal"`{{execute interrupt}}

**停止实验**

执行命令：`kubectl delete -f remove_container_by_id.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade remove-container-by-id`{{execute}}