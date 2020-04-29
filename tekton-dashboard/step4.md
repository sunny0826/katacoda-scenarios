本节中，我们将创建 PipelineRun 来构建和部署 MyApp。

## 进入 PipelineRuns 页面

点击如下链接进入 PipelineRuns 页面：
https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/#/namespaces/default/pipelineruns

或者使用左侧导航进入 `default` 命名空间的 PipelineRuns 页面。

![Navigate to PipelineRuns page screenshot](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/pipeline-runs-page.png)

## 创建 PipelineRun

点击页面右上方的 `Create +` 按钮，将弹出一个创建 PipelineRun 的表单。

该表单是动态的，会根据所选的 Pipeline 提供 PipelineResource 和 Param 字段。
我们需要 `default` 命名空间中使用 `myapp` 的 Pipeline 和 PipelineResource，创建一个 PipelineRun，故在弹出的表单中填写以下信息：

Namespace: `default`

Pipeline: `myapp`

PipelineResources source: `myapp`{{copy}}

其余字段保留默认值。

该表单内容应如下：

![Create PipelineRun form screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/create-pipeline-run-form.png)

点击 `Create` 按钮，创建 PipelineRun

![Created PipelineRun screenshot.](https://raw.githubusercontent.com/ncskier/katacoda/master/tekton-dashboard/images/created-pipeline-run.png)
