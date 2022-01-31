<h1 align="center">CATs API - Golang(Beego)</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
</p>

## Features

- You can search Cats images
- You can search Cats images by its Breed
- You can search Cats images by its Category such as Boxes,hats,sunglasses etc
- You can search Cats images by Image type such Jpg,Png,gif
- You can change the number of images per page. By defult it shows 9 images

## Languages used
- Golang

## Framework used
- Beego

## How I completed this project

- First of all, I started learning the core-concepts and syntax of Golang from https://www.golangprograms.com/go-language.html and practised Golang on https://go.dev/play/
- After completing the basics, I switched to Beego and read their official doucumentation from https://beego.vip/
- Finally, I read The CAT API documentaion from https://docs.thecatapi.com/ to understand the API responses and started working on the project.

## Prerequisite

- Install Golang
- Install Beego

## How to Install Golang

#### step 1

- Open your terminal and run the following command to make sure that you’re in the root directory.

```
cd ~
```

#### step 2

- Then use curl to retrieve/download the tarball.

```
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
```
> - Note:: If `curl` is not installed in the system, please install it by the command below

> ```
> sudo apt install curl
> ```

#### step 3

- Next, use `tar` to extract the tarball. This command includes the `-C` flag which instructs tar to change to the given directory before performing any other operations

```
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
```

#### step 5

- In this step, you will set paths in your environment. First of all, type the command below and press `ENTER`

```
sudo nano ~/.profile
```

- Then, add the following informations to the end of your profile:

```
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/yourpcname/go/bin
export GOPATH="/home/yourpcname/go/"
export GOBIN="/home/yourpcname/go/bin"
```

- After you’ve added this information to your profile, save and close the file by pressing `CTRL+X`, then `Y`, and then `ENTER`.

#### step 6

- After that type the follwing code and press `ENTER`
```
source ~/.profile
```

- Finally, check the go version using following command

```
 go version
```

## How to Install Beego and Create Project

#### step 1

- Download and install `Beego` and `Bee-Tool` by the following commands

```
go get -u github.com/beego/beego/v2
go get -u github.com/beego/bee/v2
```
> - Note: Sometimes while installing beego this error can occur `cgo: exec gcc: exec: "gcc": executable file not found in $PATH` This error occurs if the `gcc C compiler does not exist in the system.` That's why we need to install `C Compiler` by following command and then run the previous commands.

```
sudo apt-get install build-essential
```

#### step 2

- Create Beego MVC project by this command

```
bee new project_name
```

- Create Beego API project by this command

```
bee api project_name
```

#### step 3

- Init module

```
go mod tidy
```

#### step 4
- Finally, run the project by the following command

```
bee run
```

## How to run this project

- First of all, clone the project by running the following command

```
git clone https://github.com/Saklain-Tonmoy/Beego_Assignment.git
```
- Then, open the cloned folder using `VS Code` and run the following command

```
bee run
```
- Finally, open your browser and enter the following URL to check it out

```
http://localhost:8080/
```

## Feedback

If you have any feedback, please reach out to me at saklain@w3engineers.com

## 🚀 About Me

My name is Md. Golam Saklain Hossain and I'm a Softwere Engineer ...
