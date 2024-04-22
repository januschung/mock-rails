#### Introduction

This is a simple REST mock server written with Ruby on Rails `7`.

Feel free to provide feedback or feature request.


#### Available Endpoints:

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

#### Build and run
```console
rails server
```

## Contributing
I appreciate all suggestions or PRs which will help making the mock better. Feel free to fork the project and create a pull request with your idea.
