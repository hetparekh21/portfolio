
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- <div class="clearfix"></div>
         <footer class="site-footer position-relative overflow-hidden container-fluid p-0" style="margin-top:100%">
            <div class="footer-inner bg-white m-0">
               <div class="row d-flex justify-content-center align-items-center">
                  <div class="col-sm-6 text-center">
                     Copyright &copy; Text
                  </div>
                  
               </div>
            </div>
         </footer>
      </div> -->
<script src="assets/js/vendor/jquery-2.1.4.min.js"
	type="text/javascript"></script>
<script src="assets/js/popper.min.js" type="text/javascript"></script>
<script src="assets/js/plugins.js" type="text/javascript"></script>
<script src="assets/js/main.js" type="text/javascript"></script>


<!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       -->
<script>
	function formSetting() {
		// Get the checkbox
		var checkBox = document.getElementById("edit");
		if (checkBox.checked == true) {
			var form = document.getElementById("editForm");
			var elements = form.elements;
			for (var i = 0, len = elements.length; i < len; ++i) {
				elements[i].disabled = false;
			}
		} else {
			var form = document.getElementById("editForm");
			var elements = form.elements;
			for (var i = 0, len = elements.length; i < len; ++i) {
				elements[i].disabled = true;
			}
		}
	}

	function getURL(id) {
		var val = document.getElementById(id).value;
		console.log(val);
		const textarea = document.createElement('textarea');
		textarea.setAttribute('readonly', '');
		textarea.style.position = 'absolute';
		textarea.value = val;
		document.body.appendChild(textarea);
		textarea.focus();
		textarea.select();
		document.execCommand('copy');
		document.body.removeChild(textarea);
	}

	
</script>
</body>
</html>