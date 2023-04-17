document.getElementById("loginBtn").addEventListener("click", function(e) {
    e.preventDefault(); // prevent the form from submitting
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;            
    if(username=="ptsi" && password=="bumn@ptsi"){
      window.location.assign("register.html");
      alert("Login Success");
    }
    else{
      alert("Wrong Credentials!");
      return;
    }
  });  