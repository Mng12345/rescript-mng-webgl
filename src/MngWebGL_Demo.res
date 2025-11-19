// Demo usage of MngWebGL bindings

let vertexShaderSource = `
attribute vec2 a_position;

void main() {
  gl_Position = vec4(a_position, 0.0, 1.0);
}
`

let fragmentShaderSource = `
precision mediump float;

void main() {
  gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
}
`

let initWebGL = () => {
  // Get canvas element
  switch Webapi.Dom.document->Webapi.Dom.Document.getElementById("canvas") {
  | Some(canvasElement) =>
    // 使用WebGL模块的getContext方法获取WebGL上下文
    let contextAttributes: MngWebGL_Types.webGlContextAttributes = {
      alpha: true,
      depth: true,
      stencil: false,
      antialias: true,
      premultipliedAlpha: true,
      preserveDrawingBuffer: false,
      preferLowPowerToHighPerformance: false,
      failIfMajorPerformanceCaveat: false,
    }
    
    switch MngWebGL.getContextWithOptions(canvasElement, WebGL, contextAttributes) {
    | Some(gl) =>
      // Create shaders
      switch gl->MngWebGL.createShader(VertexShader) {
      | Some(vertexShader) =>
        gl->MngWebGL.shaderSource(vertexShader, vertexShaderSource)
        gl->MngWebGL.compileShader(vertexShader)

        switch gl->MngWebGL.createShader(FragmentShader) {
        | Some(fragmentShader) =>
          gl->MngWebGL.shaderSource(fragmentShader, fragmentShaderSource)
          gl->MngWebGL.compileShader(fragmentShader)

          // Create program
          switch gl->MngWebGL.createProgram {
          | Some(program) =>
            gl->MngWebGL.attachShader(program, vertexShader)
            gl->MngWebGL.attachShader(program, fragmentShader)
            gl->MngWebGL.linkProgram(program)
            gl->MngWebGL.useProgram(program)

            // Set up buffers and render
            Js.log("MngWebGL initialized successfully")
          | None => Js.log("Failed to create program")
          }
        | None => Js.log("Failed to create fragment shader")
        }
      | None => Js.log("Failed to create vertex shader")
      }
    | None => Js.log("Failed to get MngWebGL context")
    }
  | None => Js.log("Canvas element not found")
  }
}
