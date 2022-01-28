<!DOCTYPE html>

<html>

<head>
  <title>Beego Assignment</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</head>

<body>
  <section>
    <nav class="navbar sticky-top navbar-expand-lg navbar-dark" style="background-color:rgb(210, 69, 21);">
      <div class="container-fluid">
        <a class="navbar-brand" href="#" style="padding:0"><img src="../static/img/w3logo-white-3.png" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
          aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link text-white fw-bold" href="#" style="font-size: 20px;">- Saklain Tonmoy</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </section>

  <section>
    <div class="container mt-5">
      <div class="card" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
        <div class="card-body">
          <div class="m-4">
            <h1 class="text-center" style="color:rgb(210, 69, 21);">Search for CATs.</h1>
          </div>
          <div class="row mb-4">
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
              <div class="mb-3">
                <label class="form-label">Per Page</label>
                <select id="limit" class="form-select">
                  <option value="9" selected>9</option>
                  <option value="18">18</option>
                  <option value="80">80</option>
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
              <div class="mb-3">
                <label class="form-label"></label>
                <button id="more" type="button" class="btn btn-primary text-center"
                  style="width: 100%; margin-top: 8px;"><i class="fas fa-redo"></i>&ensp;More</button>
              </div>
            </div>
          </div>

          <div class="container mt-5">
            <div id="image-container" class="row">
              {{range $key, $val := .images}}
              <div class="col-md-4 mb-4">
                <div
                  style="background-image: url({{$val.Url}}); background-size: cover; height: 300px; background-repeat: no-repeat; border-radius: 10px; ">
                </div>
              </div>
              {{end}}
            </div>
          </div>

        </div>
      </div>
    </div>
  </section>

  <section class="mt-5">
    <!-- Footer -->
    <footer class="text-center text-white footer" style="background-color:rgb(210, 69, 21);">
      <!-- Grid container -->
      <div class="container pt-2 pb-2">
        <!-- Section: Social media -->
        <section class="mt-2 mb-2">
          <!-- Facebook -->
          <a class="btn btn-outline-light btn-floating circular-button m-1" href="#!" role="button"><i
              class="fab fa-facebook-f"></i></a>

          <!-- Google -->
          <a class="btn btn-outline-light btn-floating circular-button m-1" href="#!" role="button"><i
              class="fab fa-google"></i></a>

          <!-- Linkedin -->
          <a class="btn btn-outline-light btn-floating circular-button m-1" href="#!" role="button"><i
              class="fab fa-linkedin-in"></i></a>

          <!-- Github -->
          <a class="btn btn-outline-light btn-floating circular-button m-1" href="https://github.com/Saklain-Tonmoy"
            role="button"><i class="fab fa-github"></i></a>
        </section>
        <!-- Section: Social media -->
      </div>
      <!-- Grid container -->

      <!-- Copyright -->
      <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2); font-weight: bold;">
        © 2022 Copyright:
        <a class="text-white fw-bold" href="https://github.com/Saklain-Tonmoy" style="text-decoration: none;">Saklain
          Tonmoy</a>
      </div>
      <!-- Copyright -->
    </footer>
    <!-- Footer -->
  </section>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
  <script>
    let page = 0;

    $(document).on('change', 'select', function () {
      let order = $('#order').val();
      let type = $('#type').val();
      let category = $('#category').val();
      let breed = $('#breed').val();
      let limit = $('#limit').val();

      $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/fetch',
        data: {
          "order": order,
          "type": type,
          "category": category,
          "breed": breed,
          "limit": limit,
          "page": 0
        },
        success: function (response) {
          let data = response;
          console.log(data)
          let html_data = "";
          $.each(data, function (key, value) {
            html_data += '<div class="col-md-4 mb-4">',
              html_data += '<div style="background-image: url(' + value.url + '); background-size: cover; height: 300px; background-repeat: no-repeat; border-radius: 10px;"> ',
              html_data += '</div>',
              html_data += '</div>'
          })
          console.log(html_data);
          $("#image-container").html(html_data);
        },
        error: function (error) {
          console.log(error)
        }
      })
    });

    $(document).on('click', '#more', function () {
      let order = $('#order').val();
      let type = $('#type').val();
      let category = $('#category').val();
      let breed = $('#breed').val();
      let limit = $('#limit').val();
      page = page + 1;


      $.ajax({
        type: 'GET',
        url: 'http://localhost:8080/fetch',
        data: {
          "order": order,
          "type": type,
          "category": category,
          "breed": breed,
          "limit": limit,
          "page": page
        },
        success: function (response) {
          let data = response;
          console.log(data)
          let html_data = "";
          $.each(data, function (key, value) {
            html_data += '<div class="col-md-4 mb-4">',
              html_data += '<div style="background-image: url(' + value.url + '); background-size: cover; height: 200px; background-repeat: no-repeat; border-radius: 10px;"> ',
              html_data += '</div>',
              html_data += '</div>'
          })
          console.log(html_data);
          $("#image-container").html(html_data);
        },
        error: function (error) {
          console.log(error)
        }
      })
    });
  </script>
</body>

</html>