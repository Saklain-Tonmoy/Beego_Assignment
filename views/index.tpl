<!DOCTYPE html>

<html>
<head>
  <title>Beego</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

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

  <div class="container-fluid">
    <div class="row">
      <div class="col-md-6">
        Hello world
      </div>
      <div class="col-md-6">
        <section>
          <div class="container">
            <div class="card">
              
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6">
                    <div class="mb-3">
                      <label class="form-label">Order</label>
                      <select id="order" class="form-select">
                        <option value="" selected>Random</option>
                        <option value="DESC">Desc</option>
                        <option value="ASC">Asc</option>
                      </select>
                    </div>
                    <div class="mb-3">
                    <label class="form-label">Category</label>
                      <select id="category" class="form-select">
                        <option value="" selected>None</option>
                        {{range $key, $val := .categories}}
                        <option value="{{$val.Id}}">{{$val.Name}}</option>
                        {{end}}
                      </select>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="mb-3">
                      <label class="form-label">Type</label>
                      <select id="type" class="form-select">
                        <option value="" selected>All</option>
                        <option value="png,jpg">Static</option>
                        <option value="gif">Animated</option>
                      </select>
                    </div>
                    <div class="mb-3">
                    <label class="form-label">Breed</label>
                      <select id="breed" class="form-select">
                        <option value="" selected>None</option>
                        {{range $key, $val := .breeds}}
                        <option value="{{$val.Id}}">{{$val.Name}}</option>
                        {{end}}
                      </select>
                    </div>
                  </div>
                </div>

                <div class="container mt-5">
                  <div id="image-container" class="row">
                    {{range $key, $val := .images}}
                    <div class="col-md-4 mb-5 " style="position: relative">
                      <img src="{{$val.Url}}"  width="250" height="250"></img>
                    </div>
                    {{end}}
                  </div>
                </div>

                <div id="ajax-image-container" class="container mt-5 d-none">
                </div>


                <div class="row mt-5">
                  <div class="col-md-4 mb-3">
                    <label class="form-label">Per Page</label>
                    <select id="limit" class="form-select">
                      <option value="9" selected>9</option>
                      <option value="18">18</option>
                      <option value="80">80</option>
                    </select>
                  </div>
                  <div class="col-md-4 mb-3">
                    <label class="form-label"></label>
                    <button class="btn btn-primary" style="width: 100%">More</button>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script>
    $(document).on('change', '#order', function() {
      let order = $(this).val();
      let type = $('#type').val();
      let category = $('#category').val();
      let breed = $('#breed').val();
      let limit = $('#limit').val();
      console.log(order)
      console.log(type)
      console.log(category)
      console.log(breed)
      console.log(limit)

      $.ajax({
        type: 'GET',
        url: 'http://localhost:8081/fetch-data',
        data: {
          "order": order,
          "type": type,
          "category": category,
          "breed": breed,
          "limit": limit
        },
        success: function(response) {
          let data = response;
          console.log(data);
          let html_data = "";
          $.each(data, function(key, value) {
            console.log(value.url);
          })
          $.each(data, function(key, value) {
            html_data += '<div class="col-md-4 mb-5 " style="position: relative">',
            html_data += '<img src="' + value.url + '" width="250" height="250"></img>',
            html_data += '</div>'
          })
          console.log(html_data);
          $("#image-container").html(html_data);
          $("#ajax-image-container").removeClass('d-none');
        },
        error: function(error) {
          console.log(error)
        }
      })
    });
  </script>
</body>
</html>
