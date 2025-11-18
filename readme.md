# ReScript WebGL Bindings

这是一个为WebGL API编写的ReScript绑定库。它直接基于WebGL IDL定义，不依赖任何外部库。

## 特性

- **纯ReScript实现**: 完全使用ReScript编写，无外部依赖
- **类型安全**: 利用ReScript强大的类型系统提供完整的类型安全保障
- **API一致性**: 严格遵循WebGL规范，保持与原生API的一致性
- **零运行时开销**: 直接编译为高效的JavaScript代码

## 目录结构

```
src/
  WebGL.res          # 主要的WebGL绑定模块
  WebGLConstants.res # WebGL常量定义
  WebGLTypes.res     # WebGL类型定义
  Demo.res           # 示例用法
```

## 设计原则

1. **零依赖**: 不使用任何第三方库，仅使用原生Web API
2. **类型安全**: 充分利用ReScript的类型系统确保类型安全
3. **直接映射**: 直接根据WebGL IDL定义进行绑定
4. **命名约定**: 保持与WebGL API一致的命名方式
5. **模块化**: 将相关功能组织在独立模块中，便于维护和扩展

## 核心模块

### WebGLTypes.res

定义WebGL相关的类型:

- `webGlContext`
- `webGlBuffer`
- `webGlFramebuffer`
- `webGlProgram`
- `webGlRenderbuffer`
- `webGlShader`
- `webGlTexture`
- `webGlUniformLocation`
- `webGlQuery`
- `webGlSampler`
- `webGlSync`
- `webGlTransformFeedback`
- `webGlVertexArrayObject`
- 结构化类型: `webGlActiveInfo`, `webGlShaderPrecisionFormat`, `webGlContextAttributes`

### WebGLConstants.res

包含所有WebGL常量:

- 渲染模式 (POINTS, LINES, TRIANGLES等)
- 混合因子 (SRC_COLOR, DST_COLOR等)
- 缓冲区类型 (ARRAY_BUFFER, ELEMENT_ARRAY_BUFFER等)
- 纹理参数 (TEXTURE_2D, TEXTURE_WRAP_S等)

### WebGL.res

主要的API绑定模块，包含:

- 上下文创建和配置
- 着色器编译和链接
- 缓冲区对象管理
- 纹理对象管理
- 渲染循环控制

## 安装和构建

```bash
# 安装依赖
npm install

# 构建项目
npm run res:build

# 开发模式（监听文件变化）
npm run res:dev

# 清理构建产物
npm run res:clean
```

## 使用示例

```rescript
// 获取WebGL上下文
let canvas = Webapi.Dom.document->Webapi.Dom.Document.getElementById("canvas")->Webapi.Dom.Element.toCanvas
let gl = canvas->WebGL.getContext("webgl")

// 创建着色器
let vertexShader = gl->WebGL.createShader(WebGLConstants._VERTEX_SHADER)->Option.getExn
gl->WebGL.shaderSource(vertexShader, vertexShaderSource)
gl->WebGL.compileShader(vertexShader)

let fragmentShader = gl->WebGL.createShader(WebGLConstants._FRAGMENT_SHADER)->Option.getExn
gl->WebGL.shaderSource(fragmentShader, fragmentShaderSource)
gl->WebGL.compileShader(fragmentShader)

// 创建程序并链接
let program = gl->WebGL.createProgram()->Option.getExn
gl->WebGL.attachShader(program, vertexShader)
gl->WebGL.attachShader(program, fragmentShader)
gl->WebGL.linkProgram(program)
gl->WebGL.useProgram(program)

// 设置缓冲区数据
let buffer = gl->WebGL.createBuffer()->Option.getExn
gl->WebGL.bindBuffer(WebGLConstants._ARRAY_BUFFER, buffer)
let data = Float32Array.make([|0.0, 0.5, -0.5, -0.5, 0.5, -0.5|])
gl->WebGL.bufferData(WebGLConstants._ARRAY_BUFFER, data, WebGLConstants._STATIC_DRAW)

// 渲染
gl->WebGL.clearColor(0.0, 0.0, 0.0, 1.0)
gl->WebGL.clear(WebGLConstants._COLOR_BUFFER_BIT)
gl->WebGL.drawArrays(WebGLConstants._TRIANGLES, 0, 3)
```

## 实现进度

- [ ] 基础类型定义 (WebGLTypes.res)
- [ ] 常量定义 (WebGLConstants.res)
- [ ] 核心API绑定 (WebGL.res)
- [ ] 示例代码 (Demo.res)
- [ ] 测试用例

## 开发计划

1. 第一阶段：基础类型和常量定义
2. 第二阶段：核心渲染上下文API
3. 第三阶段：完整的方法绑定
4. 第四阶段：示例和测试用例
5. 第五阶段：文档完善

## 遵循的WebGL规范

本绑定库严格按照以下WebGL规范实现：

- [WebGL 1.0 Specification](https://www.khronos.org/registry/webgl/specs/latest/1.0/)
- [WebGL 2.0 Specification](https://www.khronos.org/registry/webgl/specs/latest/2.0/) (计划中)

## 注意事项

1. 所有API绑定都经过严格的类型检查
2. 错误处理采用ReScript的Option/Maybe模式
3. 内存管理遵循JavaScript垃圾回收机制
4. 性能关键路径进行了优化

## 贡献指南

欢迎提交Issue和Pull Request来改进这个绑定库。请确保:

1. 遵循现有的代码风格
2. 添加适当的类型注解
3. 更新文档和示例
4. 运行构建以确保没有错误

## 许可证

MIT