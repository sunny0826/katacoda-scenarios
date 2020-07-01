`node01` 节点磁盘占用 80%

**参数**

节点磁盘填充均支持以下参数。

| 参数 | 类型 | 说明 | 默认值 |
| --- | --- | --- | --- |
| `path` | string | 需要填充的目录 | `/` |
| `size` | string | 需要填充的文件大小，单位是 M，取值是整数，例如 --size 1024 | |
| `reserve` | string | 保留磁盘大小，单位是MB。取值是不包含单位的正整数，例如 --reserve 1024。如果 size、percent、reserve 参数都存在，优先级是 percent > reserve > size | |
| `percent` | string | 指定磁盘使用率，取值是不带%号的正整数，例如 --percent 80 | |
| `retain-handle` |  | 是否保留填充|  |
| `timeout` | string | 设定运行时长，单位是秒，通用参数 | |

**开始实验**

这里选择 `node01` 节点，可以打开 `fill_node_disk_by_names.yaml`{{open}} 查看配置。

开始实验：
`kubectl apply -f fill_node_disk_by_names.yaml`{{execute}}

**查看实验状态**

执行命令：`kubectl get blade fill-node-disk-by-names -o json`{{execute}}

等待 **phase** 状态变为 **Running**

**观测结果**

进入终端2：
`echo "Run in Terminal 2"`{{execute T2}}

可以看到磁盘占用 80%。

`df -h`{{execute}}

回到控制节点：
`echo "Run in Terminal 1"`{{execute T1}}

**停止实验**

执行命令：`kubectl delete -f fill_node_disk_by_names.yaml`{{execute}}

或者直接删除 blade 资源：`kubectl delete blade fill-node-disk-by-names`{{execute}}
