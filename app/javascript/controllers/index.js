import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import TypedJsController from "./typed_js_controller.js"
application.register("typed_js", TypedJsController)