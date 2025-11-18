// Type definitions for WebGL API bindings

// Opaque types representing WebGL objects
type webGlContext
type webGlBuffer
type webGlFramebuffer
type webGlProgram
type webGlRenderbuffer
type webGlShader
type webGlTexture
type webGlUniformLocation
type webGlAttribLocation
type webGlQuery
type webGlSampler
type webGlSync
type webGlTransformFeedback
type webGlVertexArrayObject

// Structured types
type webGlActiveInfo = {
  size: int,
  type_: int,
  name: string,
}

type webGlShaderPrecisionFormat = {
  rangeMin: int,
  rangeMax: int,
  precision: int,
}

type webGlContextAttributes = {
  alpha: bool,
  depth: bool,
  stencil: bool,
  antialias: bool,
  premultipliedAlpha: bool,
  preserveDrawingBuffer: bool,
  preferLowPowerToHighPerformance: bool,
  failIfMajorPerformanceCaveat: bool,
}

// New types for additional WebGL functionality
type rec webGlVertexAttribPointerOptions = {
  indx: int,
  size: int,
  type_: dataType,
  normalized: bool,
  stride: int,
  offset: int,
}

// Data types
and dataType =
  | @as(0x1400) Byte
  | @as(0x1401) UnsignedByte
  | @as(0x1402) Short
  | @as(0x1403) UnsignedShort
  | @as(0x1404) Int
  | @as(0x1405) UnsignedInt
  | @as(0x1406) Float

type webGlViewportOptions = {
  x: int,
  y: int,
  width: int,
  height: int,
}

type webGlScissorOptions = {
  x: int,
  y: int,
  width: int,
  height: int,
}

type webGlBlendFuncOptions = {
  sfactor: int,
  dfactor: int,
}

type webGlBlendFuncSeparateOptions = {
  srcRGB: int,
  dstRGB: int,
  srcAlpha: int,
  dstAlpha: int,
}

// Framebuffer status
type framebufferStatus =
  | @as(0x8CD5) FramebufferComplete
  | @as(0x8CD6) FramebufferIncompleteAttachment
  | @as(0x8CD7) FramebufferIncompleteMissingAttachment
  | @as(0x8CD9) FramebufferIncompleteDimensions
  | @as(0x8CDD) FramebufferUnsupported
  | @as(0x8DA7) FramebufferIncompleteMultisample
  | @as(0x8DA8) FramebufferIncompleteLayerTargets

// Renderbuffer internal formats
type renderbufferInternalFormat =
  | @as(0x84C0) Rgba4
  | @as(0x84C1) Rgb5A1
  | @as(0x84C2) Rgb565
  | @as(0x84C3) DepthComponent16
  | @as(0x84C4) StencilIndex8
  | @as(0x88F0) DepthStencil
  | @as(0x88F1) Rgb8
  | @as(0x88F2) Rgba8
  | @as(0x8CAD) DepthComponent24
  | @as(0x8CAC) DepthComponent32F
  | @as(0x88F5) Depth24Stencil8
  | @as(0x88F6) Depth32fStencil8

// Texture formats
type pixelFormat =
  | @as(0x1901) StencilIndex
  | @as(0x1902) DepthComponent
  | @as(0x1903) Alpha
  | @as(0x1904) Rgb
  | @as(0x1905) Rgba
  | @as(0x1906) Luminance
  | @as(0x1907) LuminanceAlpha
  | @as(0x1908) DepthStencil
  | @as(0x1909) Red
  | @as(0x8D94) RedInteger
  | @as(0x8D95) Rg
  | @as(0x8D96) RgInteger
  | @as(0x8D97) RgbInteger
  | @as(0x8D98) RgbaInteger

// Texture internal formats - WebGL 1.0 base formats and WebGL 2.0 sized internal formats
type textureInternalFormat =
  // WebGL 1.0 base formats (must be supported by all implementations)
  | @as(0x1903) Alpha
  | @as(0x1904) Rgb
  | @as(0x1905) Rgba
  | @as(0x1906) Luminance
  | @as(0x1907) LuminanceAlpha
  | @as(0x1902) DepthComponent
  | @as(0x84C0) DepthStencil
  
  // WebGL 2.0 sized internal formats - 8-bit color formats
  | @as(0x8229) R8
  | @as(0x822A) R8_SNORM
  | @as(0x822B) RG8
  | @as(0x822C) RG8_SNORM
  | @as(0x8051) Rgb8
  | @as(0x8C41) Srgb8
  | @as(0x8058) Rgba8
  | @as(0x8C43) Srgb8Alpha8
  
  // WebGL 2.0 sized internal formats - 16-bit color formats
  | @as(0x8056) Rgba4
  | @as(0x8057) Rgb5A1
  | @as(0x8059) Rgb10A2
  | @as(0x8D61) R16F
  | @as(0x8D62) R16I
  | @as(0x8D63) R16UI
  | @as(0x8D64) RG16F
  | @as(0x8D65) RG16I
  | @as(0x8D66) RG16UI
  | @as(0x881A) Rgba16F
  | @as(0x8818) Rgba16I
  | @as(0x8819) Rgba16UI
  
  // WebGL 2.0 sized internal formats - 32-bit color formats
  | @as(0x8D67) R32F
  | @as(0x8D68) R32I
  | @as(0x8D69) R32UI
  | @as(0x8D6A) RG32F
  | @as(0x8D6B) RG32I
  | @as(0x8D6C) RG32UI
  | @as(0x8815) Rgba32F
  | @as(0x8817) Rgba32I
  | @as(0x8816) Rgba32UI
  
  // WebGL 2.0 sized internal formats - packed color formats
  | @as(0x8D60) Rgb565
  | @as(0x8C3A) R11FG11FB10F
  | @as(0x8C3D) Rgb9E5
  
  // WebGL 2.0 sized internal formats - depth and stencil formats
  | @as(0x81A5) DepthComponent16
  | @as(0x81A6) DepthComponent24
  | @as(0x8CAC) DepthComponent32F
  | @as(0x88F0) Depth24Stencil8
  | @as(0x8CAD) Depth32FStencil8
  | @as(0x8D48) StencilIndex8

// Texture pixel types
type pixelType =
  // WebGL 1.0 base types
  | @as(0x1401) UnsignedByte                    // 8-bit unsigned integer (most common)
  | @as(0x8363) UnsignedShort565               // 5-6-5 RGB format
  | @as(0x8033) UnsignedShort4444              // 4-4-4-4 RGBA format
  | @as(0x8034) UnsignedShort5551              // 5-5-5-1 RGBA format
  
  // Extension types (require calling gl.getExtension() before use)
  | @as(0x1403) UnsignedShortExt               // 16-bit unsigned integer (WEBGL_depth_texture)
  | @as(0x1405) UnsignedIntExt                 // 32-bit unsigned integer (WEBGL_depth_texture)
  | @as(0x84FA) UnsignedInt248Webgl            // 24-8 depth stencil format (WEBGL_depth_texture)
  | @as(0x1406) FloatExt                       // 32-bit float (OES_texture_float)
  | @as(0x8D61) HalfFloatOes                   // 16-bit float (OES_texture_half_float)
  
  // WebGL 2.0 types (natively supported)
  | @as(0x1400) Byte                           // 8-bit signed integer
  | @as(0x1402) Short                          // 16-bit signed integer
  | @as(0x1404) Int                            // 32-bit signed integer
  | @as(0x140B) HalfFloat                      // 16-bit float
  | @as(0x8368) UnsignedInt2101010Rev          // 10-10-10-2 packed format
  | @as(0x8C3B) UnsignedInt10F11F11FRev        // 11-11-10 float packed format
  | @as(0x8C3E) UnsignedInt5999Rev             // 9-9-9-5 float packed format
  | @as(0x8DAD) Float32UnsignedInt248Rev       // 32 float + 24-8 depth stencil

// Culling modes
type cullFaceMode =
  | @as(0x0404) Front
  | @as(0x0405) Back
  | @as(0x0408) FrontAndBack

// Front face direction
type frontFaceDirection =
  | @as(0x0900) Cw
  | @as(0x0901) Ccw

// Blending factors
type blendingFactor =
  | @as(0) Zero
  | @as(1) One
  | @as(0x0300) SrcColor
  | @as(0x0301) OneMinusSrcColor
  | @as(0x0302) SrcAlpha
  | @as(0x0303) OneMinusSrcAlpha
  | @as(0x0304) DstAlpha
  | @as(0x0305) OneMinusDstAlpha
  | @as(0x0306) DstColor
  | @as(0x0307) OneMinusDstColor
  | @as(0x0308) SrcAlphaSaturate
  | @as(0x8001) ConstantColor
  | @as(0x8002) OneMinusConstantColor
  | @as(0x8003) ConstantAlpha
  | @as(0x8004) OneMinusConstantAlpha

// Test functions
type testFunction =
  | @as(0x0200) Never
  | @as(0x0201) Less
  | @as(0x0202) Equal
  | @as(0x0203) LessEqual
  | @as(0x0204) Greater
  | @as(0x0205) NotEqual
  | @as(0x0206) GreaterEqual
  | @as(0x0207) Always

// Stencil operations
type stencilOperation =
  | @as(0) Keep
  | @as(0x1E00) Replace
  | @as(0x1E01) Incr
  | @as(0x1E02) Decr
  | @as(0x1E03) Invert
  | @as(0x8507) IncrWrap
  | @as(0x8508) DecrWrap

// Hints
type hintTarget =
  | @as(0x0C50) GenerateMipmapHint
  | @as(0x8692) FragmentShaderDerivativeHint

type hintMode =
  | @as(0x1100) Fastest
  | @as(0x1101) Nicest
  | @as(0x1102) DontCare

// Errors
type errorCodes =
  | @as(0) NoError
  | @as(0x0500) InvalidEnum
  | @as(0x0501) InvalidValue
  | @as(0x0502) InvalidOperation
  | @as(0x0503) OutOfMemory
  | @as(0x0504) InvalidFramebufferOperation
  | @as(0x0505) ContextLostWebgl
