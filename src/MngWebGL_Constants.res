// WebGL Constants

// Clear buffer bits
type clearBufferMask =
  | @as(0x00000100) DepthBufferBit
  | @as(0x00000400) StencilBufferBit
  | @as(0x00004000) ColorBufferBit

let _DEPTH_BUFFER_BIT: clearBufferMask = DepthBufferBit
let _STENCIL_BUFFER_BIT: clearBufferMask = StencilBufferBit
let _COLOR_BUFFER_BIT: clearBufferMask = ColorBufferBit

// Buffers
type bufferType =
  | @as(0x8892) ArrayBuffer
  | @as(0x8893) ElementArrayBuffer
  | @as(0x8A11) UniformBuffer

let _ARRAY_BUFFER: bufferType = ArrayBuffer
let _ELEMENT_ARRAY_BUFFER: bufferType = ElementArrayBuffer
let _UNIFORM_BUFFER: bufferType = UniformBuffer

// Begin modes
type beginMode =
  | @as(0x0000) Points
  | @as(0x0001) Lines
  | @as(0x0002) LineLoop
  | @as(0x0003) LineStrip
  | @as(0x0004) Triangles
  | @as(0x0005) TriangleStrip
  | @as(0x0006) TriangleFan

let _POINTS: beginMode = Points
let _LINES: beginMode = Lines
let _LINE_LOOP: beginMode = LineLoop
let _LINE_STRIP: beginMode = LineStrip
let _TRIANGLES: beginMode = Triangles
let _TRIANGLE_STRIP: beginMode = TriangleStrip
let _TRIANGLE_FAN: beginMode = TriangleFan

// Data types
type dataType =
  | @as(0x1400) Byte
  | @as(0x1401) UnsignedByte
  | @as(0x1402) Short
  | @as(0x1403) UnsignedShort
  | @as(0x1404) Int
  | @as(0x1405) UnsignedInt
  | @as(0x1406) Float

let _BYTE: dataType = Byte
let _UNSIGNED_BYTE: dataType = UnsignedByte
let _SHORT: dataType = Short
let _UNSIGNED_SHORT: dataType = UnsignedShort
let _INT: dataType = Int
let _UNSIGNED_INT: dataType = UnsignedInt
let _FLOAT: dataType = Float

// Enable caps
type enableCap =
  | @as(0x0B44) CullFace
  | @as(0x0BE2) Blend
  | @as(0x0BD0) Dither
  | @as(0x0B90) StencilTest
  | @as(0x0B71) DepthTest
  | @as(0x0C11) ScissorTest
  | @as(0x8037) PolygonOffsetFill
  | @as(0x809E) SampleAlphaToCoverage
  | @as(0x80A0) SampleCoverage

let _CULL_FACE: enableCap = CullFace
let _BLEND: enableCap = Blend
let _DITHER: enableCap = Dither
let _STENCIL_TEST: enableCap = StencilTest
let _DEPTH_TEST: enableCap = DepthTest
let _SCISSOR_TEST: enableCap = ScissorTest
let _POLYGON_OFFSET_FILL: enableCap = PolygonOffsetFill
let _SAMPLE_ALPHA_TO_COVERAGE: enableCap = SampleAlphaToCoverage
let _SAMPLE_COVERAGE: enableCap = SampleCoverage

// Shader types
type shaderType =
  | @as(0x8B31) VertexShader
  | @as(0x8B30) FragmentShader

let _VERTEX_SHADER: shaderType = VertexShader
let _FRAGMENT_SHADER: shaderType = FragmentShader

// Texture targets
type textureType =
  | @as(0x0DE1) Texture2D
  | @as(0x8513) TextureCubeMap

let _TEXTURE_2D: textureType = Texture2D
let _TEXTURE_CUBE_MAP: textureType = TextureCubeMap

// Buffer usage
type bufferUsage =
  | @as(0x88E0) StreamDraw
  | @as(0x88E4) StaticDraw
  | @as(0x88E8) DynamicDraw

let _STREAM_DRAW: bufferUsage = StreamDraw
let _STATIC_DRAW: bufferUsage = StaticDraw
let _DYNAMIC_DRAW: bufferUsage = DynamicDraw

// Texture filters
type textureFilter =
  | @as(0x2600) Nearest
  | @as(0x2601) Linear

let _NEAREST: textureFilter = Nearest
let _LINEAR: textureFilter = Linear

// Texture types
type textureParameter =
  | @as(0x2800) TextureMagFilter
  | @as(0x2801) TextureMinFilter
  | @as(0x2802) TextureWrapS
  | @as(0x2803) TextureWrapT

let _TEXTURE_MAG_FILTER: textureParameter = TextureMagFilter
let _TEXTURE_MIN_FILTER: textureParameter = TextureMinFilter
let _TEXTURE_WRAP_S: textureParameter = TextureWrapS
let _TEXTURE_WRAP_T: textureParameter = TextureWrapT

// Texture wrap modes
type textureWrap =
  | @as(0x2901) Repeat
  | @as(0x812F) ClampToEdge
  | @as(0x8370) MirroredRepeat

let _REPEAT: textureWrap = Repeat
let _CLAMP_TO_EDGE: textureWrap = ClampToEdge
let _MIRRORED_REPEAT: textureWrap = MirroredRepeat

// Shader params
type shaderParameter =
  | @as(0x8B81) CompileStatus
  | @as(0x8B80) DeleteStatus
  | @as(0x8B82) LinkStatus
  | @as(0x8B83) ValidateStatus

let _COMPILE_STATUS: shaderParameter = CompileStatus
let _DELETE_STATUS: shaderParameter = DeleteStatus
let _LINK_STATUS: shaderParameter = LinkStatus
let _VALIDATE_STATUS: shaderParameter = ValidateStatus

// Program params
type programParameter =
  | @as(0x8B85) AttachedShaders
  | @as(0x8B86) ActiveUniforms
  | @as(0x8B89) ActiveAttributes
  | @as(0x8B82) LinkStatus
  | @as(0x8B83) ValidateStatus

let _ATTACHED_SHADERS: programParameter = AttachedShaders
let _ACTIVE_UNIFORMS: programParameter = ActiveUniforms
let _ACTIVE_ATTRIBUTES: programParameter = ActiveAttributes
let _LINK_STATUS: programParameter = LinkStatus
let _VALIDATE_STATUS: programParameter = ValidateStatus