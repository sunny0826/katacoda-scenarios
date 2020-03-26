Katacoda 课程是通过创建路径文件定义的。该途径定义了课程中应包括哪些场景以及显示它们的顺序。

本示例集合包含两门课程，一门课程描述了 Katacoda 的所有内容，另一门课程描述了关键的 Katacoda 环境。

## Clone Example

使用命令 `git clone https://github.com/katacoda/scenario-examples.git katacoda-scenario-examples`{{execute}} 拉取示例库。

在存储库的根目录中，已创建了一个名为的 `uilayouts` 的课程。该课程的内容已定义为 `katacoda-scenario-examples/uilayouts-pathway.json`{{open}}。

在JSON文件中，courses 定义了每个 scenario。例如：

<pre class="file">
{
    "course_id": "uilayout-terminal",
    "title": "Scenario with Terminal UI",
    "description": "Katacoda Scenario Example"
},
</pre>

**course_id** 是课程目录中的 scenario 名称目录。例如 `ls katacoda-scenario-examples/uilayouts/uilayout-terminal`{{execute}}。**title** 和 **description** 将会显示课程页面上。
