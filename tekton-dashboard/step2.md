本节中，我们将会导入一个 Tekton Pipeline 来构建和部署一个使用 Node.js 开发的 demo：[MyApp](https://github.com/ncskier/myapp)（MyApp 可以随机显示一张猫咪的图片）。

## 打开 Tekton Dashboard 导入 Tekton 资源页面

点击如下的链接，进入导入 Tekton 资源页面：
https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/#/importresources

或在左侧导航中点击 `Import Tekton resources` 进入页面。

## 导入 MyApp 的 Tekton 资源

MyApp 的 Tekton 资源 存放在 [`tekton/`](https://github.com/ncskier/myapp/tree/master/tekton) 目录。通过填写以下信息，将这些Tekton资源导入到 `default` 命名空间中：

Repository URL: `https://github.com/ncskier/myapp`{{copy}}

Namespace: `default`

Repository directory: `tekton/`{{copy}}

Service Account `tekton-dashboard`

该表格的内容应如下：

![Import Tekton resources screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/import-tekton-resources.png)

点击 `Import and Apply` 按钮。

## 查看 Tekton 资源导入进度

Dashboard 会创建一个 PipelineRun 来导入指定的 Tekton 资源。

点击页面底部的 `View status of this run` 链接，查看 MyApp 导入 Tekton 资源的状态。

![View status of importing Tekton resources screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/view-status-of-pipeline0.png)

PipelineRun 完成后，Tekton 资源已导入成功。

![Import Tekton resources PipelineRun logs screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/import-pipelinerun-logs.png)
