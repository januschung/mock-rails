#### Introduction

This is a simple REST mock server written with Ruby on Rails `7`.

It provides sample endpoints to render output either based on static resource file or simple logic defined in the controllers.

Feel free to provide feedback or feature request.

#### Customize the Mock Service

For the resouce endpoint, You can modify the return value by adding a new file or editing the file under `config/resource` folder.

#### Available Endpoints:

<details>
<summary>/resource/[value]</summary>

This mock service returns static response from the file located in `src/main/resources/data`

_Sample 1_

**curl "http://localhost:5000/resource/100"**

will return 

```console
[
 {"id":"100","name":"jack","age":"30"},
 {"id":"101","name":"jill","age":"32"}
]
```

_Sample 2_

**curl "http://localhost:5000/resource/200"**

will return

```console
[
 {"id":"200","name":"tom","age":"40"},
 {"id":"201","name":"jerry","age":"28"}
]
```

When request with a non existing file, the response will be reading from file `empty`

_Sample 3_

**curl "http://localhost:5000/resource/300"**


will return

```console
[]
```
</details>

<details>
<summary>/http_status/[value]</summary>

_Sample 1_

**curl "http://localhost:5000/http_status/200"**


will return status code 200 and the following response

```console
200 ok
```

_Sample 2_

**curl "http://localhost:5000/http_status/400"**


will return status code 400 and the following response

```console
400 bad request
```

</details>

<details>
<summary>/delay/[value]</summary>

_Sample 1_

**curl "http://localhost:5000/delay/3000"**


will return response with 3000 milliseconds delay

```console
Response with delay of 3000 milliseconds
```
</details>

<details>
<summary>/post/json?display_payload=[true|false]</summary>

_Sample 1_

**curl -X POST 'http://localhost:3000/post/json?display_payload=true' -H "Content-Type: application/json" -d '{"key": "value"}'n**

will return the payload and the duration of the request

```console
{"payload":{"key":"value"},"duration":"0.0 seconds"}
```

_Sample 2_

**curl -X POST 'http://localhost:3000/post/json?display_payload=false' -H "Content-Type: application/json" -d '{"key": "value"}'n**

will return the payload and the duration of the request

```console
{"duration":"0.0 seconds"}
```
</details>

#### Build and run
```console
rails server
```

## Contributing
I appreciate all suggestions or PRs which will help making the mock better. Feel free to fork the project and create a pull request with your idea.
