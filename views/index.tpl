<!DOCTYPE html>

<html>
<head>
  <title>Beego</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body>
  <section>
    <nav class="navbar sticky-top navbar-expand-lg navbar-dark" style="background-color:#103076;">
      <div class="container-fluid">
        <a class="navbar-brand" href="#"><img src="../static/img/header_logo.svg" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
          aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="#">Pricing</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Documentation</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </section>


  <section>
    <div class="container">
      <div class="card">
        
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
              </div>
              <div class="mb-3">
              <label class="form-label">Category</label>
                <select class="form-select">
                  <option selected>None</option>
                  {{range $key, $val := .categories}}
                  <option value="{{$val.Id}}">{{$val.Name}}</option>
                  {{end}}
                </select>
              </div>
            </div>

            <div class="col-md-6">
              <div class="mb-3">
                <label for="exampleFormControlInput1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
              </div>
              <div class="mb-3">
              <label class="form-label">Breed</label>
                <select class="form-select">
                  <option selected>Open this select menu</option>
                  {{range $key, $val := .breeds}}
                  <option value="{{$val.Id}}">{{$val.Name}}</option>
                  {{end}}
                </select>
              </div>
            </div>
          </div>
          
        </div>
      </div>
    </div>
  </section>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
