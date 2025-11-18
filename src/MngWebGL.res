// Main WebGL API bindings
module Types = MngWebGL_Types
module Constants = MngWebGL_Constants

// Type aliases for better readability
type context = Types.webGlContext
type buffer = Types.webGlBuffer
type shader = Types.webGlShader
type program = Types.webGlProgram
type texture = Types.webGlTexture
type uniformLocation = Types.webGlUniformLocation
type attribLocation = Types.webGlAttribLocation
type activeInfo = Types.webGlActiveInfo
type framebuffer = Types.webGlFramebuffer
type renderbuffer = Types.webGlRenderbuffer
type webGlVertexArrayObject = Types.webGlVertexArrayObject

// Importing types from Constants
type bufferType = Constants.bufferType
type shaderType = Constants.shaderType
type beginMode = Constants.beginMode
type dataType = Constants.dataType
type bufferUsage = Constants.bufferUsage
type clearBufferMask = Constants.clearBufferMask
type enableCap = Constants.enableCap
type textureType = Constants.textureType
type textureParameter = Constants.textureParameter
type textureFilter = Constants.textureFilter
type textureWrap = Constants.textureWrap
type shaderParameter = Constants.shaderParameter
type programParameter = Constants.programParameter
type framebufferStatus = Types.framebufferStatus
type renderbufferInternalFormat = Types.renderbufferInternalFormat
type pixelFormat = Types.pixelFormat

// Context creation and configuration
@val external getContext: (Dom.element, string) => option<context> = "getContext"
@send
external getContextAttributes: context => Types.webGlContextAttributes = "getContextAttributes"
@send external isContextLost: context => bool = "isContextLost"
@send external drawingBufferWidth: context => int = "drawingBufferWidth"
@send external drawingBufferHeight: context => int = "drawingBufferHeight"

// Creating and deleting objects
@send external createBuffer: context => option<buffer> = "createBuffer"
@send external deleteBuffer: (context, buffer) => unit = "deleteBuffer"
@send external isBuffer: (context, buffer) => bool = "isBuffer"

@send external createShader: (context, shaderType) => option<shader> = "createShader"
@send external deleteShader: (context, shader) => unit = "deleteShader"

@send external createProgram: context => option<program> = "createProgram"
@send external deleteProgram: (context, program) => unit = "deleteProgram"
@send external detachShader: (context, program, shader) => unit = "detachShader"

@send external createTexture: context => option<texture> = "createTexture"
@send external deleteTexture: (context, texture) => unit = "deleteTexture"
@send external isTexture: (context, texture) => bool = "isTexture"

// Framebuffer operations
@send external createFramebuffer: context => option<framebuffer> = "createFramebuffer"
@send external deleteFramebuffer: (context, framebuffer) => unit = "deleteFramebuffer"
@send external bindFramebuffer: (context, int, framebuffer) => unit = "bindFramebuffer"
@send
external framebufferTexture2D: (context, int, int, textureType, texture, int) => unit =
  "framebufferTexture2D"
@send
external framebufferRenderbuffer: (context, int, int, int, renderbuffer) => unit =
  "framebufferRenderbuffer"
@send external checkFramebufferStatus: context => framebufferStatus = "checkFramebufferStatus"
@send external isFramebuffer: (context, framebuffer) => bool = "isFramebuffer"

// Renderbuffer operations
@send external createRenderbuffer: context => option<renderbuffer> = "createRenderbuffer"
@send external deleteRenderbuffer: (context, renderbuffer) => unit = "deleteRenderbuffer"
@send external bindRenderbuffer: (context, int, renderbuffer) => unit = "bindRenderbuffer"
@send
external renderbufferStorage: (context, int, renderbufferInternalFormat, int, int) => unit =
  "renderbufferStorage"
@send external isRenderbuffer: (context, renderbuffer) => bool = "isRenderbuffer"

// Buffer operations
@send external bindBuffer: (context, bufferType, buffer) => unit = "bindBuffer"
@send
external bufferData: (context, bufferType, TypedArray.t<'a>, bufferUsage) => unit = "bufferData"
@send external bufferSubData: (context, bufferType, int, TypedArray.t<'a>) => unit = "bufferSubData"
@send external getBufferParameter: (context, bufferType, int) => 'a = "getBufferParameter"

// Shader operations
@send external shaderSource: (context, shader, string) => unit = "shaderSource"
@send external compileShader: (context, shader) => unit = "compileShader"
@send external getShaderParameter: (context, shader, shaderParameter) => 'a = "getShaderParameter"
@send external getShaderInfoLog: (context, shader) => string = "getShaderInfoLog"
@send external getShaderSource: (context, shader) => string = "getShaderSource"
@send external isShader: (context, shader) => bool = "isShader"

// Program operations
@send external attachShader: (context, program, shader) => unit = "attachShader"
@send
external bindAttribLocation: (context, program, attribLocation, string) => unit =
  "bindAttribLocation"
@send external linkProgram: (context, program) => unit = "linkProgram"
@send external useProgram: (context, program) => unit = "useProgram"
@send
external getProgramParameter: (context, program, programParameter) => 'a = "getProgramParameter"
@send external getActiveAttrib: (context, program, int) => activeInfo = "getActiveAttrib"
@send external getActiveUniform: (context, program, int) => activeInfo = "getActiveUniform"
@send external getAttachedShaders: (context, program) => array<shader> = "getAttachedShaders"
@send external getAttribLocation: (context, program, string) => attribLocation = "getAttribLocation"
@send
external getUniformLocation: (context, program, string) => option<uniformLocation> =
  "getUniformLocation"
@send external isProgram: (context, program) => bool = "isProgram"
@send external getProgramInfoLog: (context, program) => string = "getProgramInfoLog"
@send external validateProgram: (context, program) => unit = "validateProgram"

// Uniform setters
@send external uniform1f: (context, uniformLocation, float) => unit = "uniform1f"
@send external uniform2f: (context, uniformLocation, float, float) => unit = "uniform2f"
@send external uniform3f: (context, uniformLocation, float, float, float) => unit = "uniform3f"
@send
external uniform4f: (context, uniformLocation, float, float, float, float) => unit = "uniform4f"

@send external uniform1i: (context, uniformLocation, int) => unit = "uniform1i"
@send external uniform2i: (context, uniformLocation, int, int) => unit = "uniform2i"
@send external uniform3i: (context, uniformLocation, int, int, int) => unit = "uniform3i"
@send external uniform4i: (context, uniformLocation, int, int, int, int) => unit = "uniform4i"

@send external uniform1fv: (context, uniformLocation, TypedArray.t<float>) => unit = "uniform1fv"
@send external uniform2fv: (context, uniformLocation, TypedArray.t<float>) => unit = "uniform2fv"
@send external uniform3fv: (context, uniformLocation, TypedArray.t<float>) => unit = "uniform3fv"
@send external uniform4fv: (context, uniformLocation, TypedArray.t<float>) => unit = "uniform4fv"

@send external uniform1iv: (context, uniformLocation, TypedArray.t<int>) => unit = "uniform1iv"
@send external uniform2iv: (context, uniformLocation, TypedArray.t<int>) => unit = "uniform2iv"
@send external uniform3iv: (context, uniformLocation, TypedArray.t<int>) => unit = "uniform3iv"
@send external uniform4iv: (context, uniformLocation, TypedArray.t<int>) => unit = "uniform4iv"

@send
external uniformMatrix2fv: (context, uniformLocation, bool, TypedArray.t<float>) => unit =
  "uniformMatrix2fv"
@send
external uniformMatrix3fv: (context, uniformLocation, bool, TypedArray.t<float>) => unit =
  "uniformMatrix3fv"
@send
external uniformMatrix4fv: (context, uniformLocation, bool, TypedArray.t<float>) => unit =
  "uniformMatrix4fv"

// Texture operations
@send external activeTexture: (context, int) => unit = "activeTexture"
@send external bindTexture: (context, textureType, texture) => unit = "bindTexture"
@send
external texImage2D: (
  context,
  textureType,
  int,
  int,
  int,
  int,
  int,
  int,
  int,
  TypedArray.t<'a>,
) => unit = "texImage2D"
@send
external compressedTexImage2D: (
  context,
  textureType,
  int,
  int,
  int,
  int,
  int,
  TypedArray.t<'a>,
) => unit = "compressedTexImage2D"
@send
external texParameteri: (context, textureType, textureParameter, int) => unit = "texParameteri"
@send
external texParameterf: (context, textureType, textureParameter, float) => unit = "texParameterf"
@send
external texSubImage2D: (
  context,
  textureType,
  int,
  int,
  int,
  int,
  int,
  int,
  int,
  TypedArray.t<'a>,
) => unit = "texSubImage2D"
@send
external compressedTexSubImage2D: (
  context,
  textureType,
  int,
  int,
  int,
  int,
  int,
  int,
  TypedArray.t<'a>,
) => unit = "compressedTexSubImage2D"
@send
external copyTexImage2D: (context, textureType, int, pixelFormat, int, int, int, int) => unit =
  "copyTexImage2D"
@send
external copyTexSubImage2D: (context, textureType, int, int, int, int, int, int, int) => unit =
  "copyTexSubImage2D"
@send external generateMipmap: (context, textureType) => unit = "generateMipmap"
@send external isSampler: (context, Types.webGlSampler) => bool = "isSampler"

// Vertex attributes
@send
external enableVertexAttribArray: (context, attribLocation) => unit = "enableVertexAttribArray"
@send
external disableVertexAttribArray: (context, attribLocation) => unit = "disableVertexAttribArray"
@send
external vertexAttribPointer: (context, attribLocation, int, dataType, bool, int, int) => unit =
  "vertexAttribPointer"
@send external vertexAttrib1f: (context, attribLocation, float) => unit = "vertexAttrib1f"
@send external vertexAttrib2f: (context, attribLocation, float, float) => unit = "vertexAttrib2f"
@send
external vertexAttrib3f: (context, attribLocation, float, float, float) => unit = "vertexAttrib3f"
@send
external vertexAttrib4f: (context, attribLocation, float, float, float, float) => unit =
  "vertexAttrib4f"
@send
external vertexAttrib1fv: (context, attribLocation, TypedArray.t<float>) => unit = "vertexAttrib1fv"
@send
external vertexAttrib2fv: (context, attribLocation, TypedArray.t<float>) => unit = "vertexAttrib2fv"
@send
external vertexAttrib3fv: (context, attribLocation, TypedArray.t<float>) => unit = "vertexAttrib3fv"
@send
external vertexAttrib4fv: (context, attribLocation, TypedArray.t<float>) => unit = "vertexAttrib4fv"
@send external getVertexAttrib: (context, attribLocation, int) => 'a = "getVertexAttrib"
@send
external getVertexAttribOffset: (context, attribLocation, int) => int = "getVertexAttribOffset"

// Rendering
@send external clearColor: (context, float, float, float, float) => unit = "clearColor"
@send external clearDepth: (context, float) => unit = "clearDepth"
@send external clearStencil: (context, int) => unit = "clearStencil"
@send external clear: (context, clearBufferMask) => unit = "clear"
@send external drawArrays: (context, beginMode, int, int) => unit = "drawArrays"
@send external drawElements: (context, beginMode, int, dataType, int) => unit = "drawElements"
@send external enable: (context, enableCap) => unit = "enable"
@send external disable: (context, enableCap) => unit = "disable"
@send external finish: context => unit = "finish"
@send external flush: context => unit = "flush"
@send external sampleCoverage: (context, float, bool) => unit = "sampleCoverage"

// State checks
@send external isEnabled: (context, enableCap) => bool = "isEnabled"
@send external getError: context => int = "getError"
@send external getParameter: (context, int) => 'a = "getParameter"
@send
external readPixels: (context, int, int, int, int, int, int, TypedArray.t<'a>) => unit =
  "readPixels"

// Viewport and scissor
@send external viewport: (context, int, int, int, int) => unit = "viewport"
@send external scissor: (context, int, int, int, int) => unit = "scissor"

// Depth
@send external depthFunc: (context, int) => unit = "depthFunc"
@send external depthMask: (context, bool) => unit = "depthMask"
@send external depthRange: (context, float, float) => unit = "depthRange"

// Blend
@send external blendFunc: (context, int, int) => unit = "blendFunc"
@send external blendFuncSeparate: (context, int, int, int, int) => unit = "blendFuncSeparate"
@send external blendEquation: (context, int) => unit = "blendEquation"
@send external blendEquationSeparate: (context, int, int) => unit = "blendEquationSeparate"
@send external blendColor: (context, float, float, float, float) => unit = "blendColor"

// Stencil
@send external stencilFunc: (context, int, int, int) => unit = "stencilFunc"
@send external stencilFuncSeparate: (context, int, int, int, int) => unit = "stencilFuncSeparate"
@send external stencilMask: (context, int) => unit = "stencilMask"
@send external stencilMaskSeparate: (context, int, int) => unit = "stencilMaskSeparate"
@send external stencilOp: (context, int, int, int) => unit = "stencilOp"
@send external stencilOpSeparate: (context, int, int, int, int) => unit = "stencilOpSeparate"

// Face culling
@send external cullFace: (context, int) => unit = "cullFace"
@send external frontFace: (context, int) => unit = "frontFace"

// Color mask
@send external colorMask: (context, bool, bool, bool, bool) => unit = "colorMask"

// Polygon offset
@send external polygonOffset: (context, float, float) => unit = "polygonOffset"

// Pixel storage
@send external pixelStorei: (context, int, int) => unit = "pixelStorei"

// Hint
@send external hint: (context, int, int) => unit = "hint"

// Line width
@send external lineWidth: (context, float) => unit = "lineWidth"

// Extensions support
@send external getSupportedExtensions: context => array<string> = "getSupportedExtensions"
@send external getExtension: (context, string) => 'a = "getExtension"

// Additional methods for framebuffer operations
@send
external getFramebufferAttachmentParameter: (context, int, int, int) => 'a =
  "getFramebufferAttachmentParameter"

// Additional methods for renderbuffer operations
@send external getRenderbufferParameter: (context, int, int) => 'a = "getRenderbufferParameter"

// Additional texture operations
@send external getTexParameter: (context, textureType, int) => 'a = "getTexParameter"
@send external getUniform: (context, program, uniformLocation) => 'a = "getUniform"

// Additional program operations
@send
external getShaderPrecisionFormat: (context, shaderType, int) => Types.webGlShaderPrecisionFormat =
  "getShaderPrecisionFormat"

// Commit method
@send external commit: context => unit = "commit"

// MakeXRCompatible method
@send external makeXRCompatible: context => promise<unit> = "makeXRCompatible"
