// Demo usage of WebGL bindings

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
    switch WebGL.getContext(canvasElement, "webgl") {
    | Some(gl) =>
      // Create shaders
      switch gl->WebGL.createShader(VertexShader) {
      | Some(vertexShader) =>
        gl->WebGL.shaderSource(vertexShader, vertexShaderSource)
        gl->WebGL.compileShader(vertexShader)

        switch gl->WebGL.createShader(FragmentShader) {
        | Some(fragmentShader) =>
          gl->WebGL.shaderSource(fragmentShader, fragmentShaderSource)
          gl->WebGL.compileShader(fragmentShader)

          // Create program
          switch gl->WebGL.createProgram {
          | Some(program) =>
            gl->WebGL.attachShader(program, vertexShader)
            gl->WebGL.attachShader(program, fragmentShader)
            gl->WebGL.linkProgram(program)
            gl->WebGL.useProgram(program)

            // Set up buffers and render
            Js.log("WebGL initialized successfully")
          | None => Js.log("Failed to create program")
          }
        | None => Js.log("Failed to create fragment shader")
        }
      | None => Js.log("Failed to create vertex shader")
      }
    | None => Js.log("Failed to get WebGL context")
    }
  | None => Js.log("Canvas element not found")
  }
}
