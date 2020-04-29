本节中，我们将为 MyApp 创建 git PipelineResource，之后将使用 PipelineResource 运行 Pipeline 来构建和部署 MyApp。

## 进入 PipelineResources 页面

点击如下链接进入 PipelineResources 页面：
https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/#/namespaces/default/pipelineresources

或者使用左侧导航进入 `default` 命名空间的 PipelineResources 页面。

*确保在命名空间下拉菜单中选择了 `default`。*

![Navigate to PipelineResources page screenshot](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/pipeline-resources-page.png)

## 创建 PipelineResource

点击页面右上方的 `Create +` 按钮，将弹出一个创建 PipelineResource 的表单。

我们要在 `default` 命名空间中为 MyApp的 `master` 分支创建一个 git PipelineResource，故在弹出的表单中填写以下信息：

Name: `myapp`{{copy}}

Namespace: `default`

Type: `Git`

URL: `https://github.com/ncskier/myapp`{{copy}}

Revision: `master`{{copy}}

该表单内容应如下：

![Create PipelineResource form screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/create-pipeline-resource-form.png)

点击 `Create` 按钮，创建 PipelineResource。

![Created PipelineResource screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/created-pipeline-resource.png)