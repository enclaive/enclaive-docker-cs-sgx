SGX c# demonstration



##Building and Running


```sh
docker build . -t enclaive-docker-cs-sgx && docker run --rm --name enclaive-docker-cs-sgx   -ti --privileged enclaive-docker-cs-sgx
```


## observe the app is reading shakespeare

```
Contents of hello.txt = From fairest creatures we desire increase,
That thereby beauty's rose might never die,
But as the riper should by time decease,
```


## attempt manipulation of inputs

while the app is running in a different terminal

```
docker exec -ti  enclaive-docker-cs-sgx sh -c 'echo im a bad bad man > /app/hello.txt'
```


## observe that the app refuses to read the bad text

```
error: Accessing file '/app/hello.txt' is denied: incorrect hash of file chunk at 0-17.

Unhandled Exception:
System.UnauthorizedAccessException: Access to the path "/app/hello.txt" is denied.
```



