项目： Aries<br/>
说明： 存放项目协议文件，作为子模块供其他项目使用<br/>
规则： 添加/删除/更新 proto 目录下文件<br/>
       -新增 proto 时， 需要更新 protoheader.h<br/>
       -通知其他项目更新子模块 [git submodule update --remote]<br/>
重要： 目前已知 datacenter、CarFox、CarInfoTestTools 使用本模块<br/>
用法：<br/>
- 项目文件 <br/>
> include(PATH_TO_PTORO/protofile/proto.pri)<br/>
> INCLUDEPATH += PATH_TO_PTORO/protofile<br/>
> HEADERS += $$files(PATH_TO_PTORO/protofile/protoheader.h)<br/>
- 项目代码 <br/>
> #include "protoheader.h"<br/>
<br/>
问题： Windows平台未测试<br/>

文件列表说明：<br/>
$ tree -L 1<br/>
.<br/>
├── demo		# 测试项目<br/>
├── proto		# 存放项目协议<br/>
├── protobuf		# Google Protobuf 链接库<br/>
├── protocode		# 存放编译生成的 proto 文件<br/>
├── protoheader.h	# 供其他文件使用<br/>
├── proto.pri		# 供其他项目使用<br/>
└── Readme.md		# Readme<br/>
<br/>
