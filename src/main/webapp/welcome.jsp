<!DOCTYPE html>

<%@ page isELIgnored = "false" %>
<html lang="en">

<%! String cv = ""; %>

<%
         Cookie cookie = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
            
            for (int i = 0; i < cookies.length; i++) {
               if(cookies[i].getName().equals("user_id")) {
					cv = cookies[i].getValue();
					break;
				}else{
			cv = "";
		}
            }
         }else{
			cv = "";
		}
      %>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>FlexStart Bootstrap Template - Index</title>
<meta content="" name="description">

<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<!-- <link href="assets/css/style.css" rel="stylesheet"> -->

<style>
	/**
* Template Name: FlexStart - v1.11.0
* Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/

/*--------------------------------------------------------------
# General
--------------------------------------------------------------*/
:root {
  scroll-behavior: smooth;
}

body {
  font-family: "Open Sans", sans-serif;
  color: #444444;
}

a {
  color: #4154f1;
  text-decoration: none;
}

a:hover {
  color: #717ff5;
  text-decoration: none;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Nunito", sans-serif;
}

/*--------------------------------------------------------------
# Sections
--------------------------------------------------------------*/
section {
  padding: 60px 0;
  overflow: hidden;
}

.section-header {
  text-align: center;
  padding-bottom: 40px;
}

.section-header h2 {
  font-size: 13px;
  letter-spacing: 1px;
  font-weight: 700;
  margin: 0;
  color: #4154f1;
  text-transform: uppercase;
}

.section-header p {
  margin: 10px 0 0 0;
  padding: 0;
  font-size: 38px;
  line-height: 42px;
  font-weight: 700;
  color: #012970;
}

@media (max-width: 768px) {
  .section-header p {
    font-size: 28px;
    line-height: 32px;
  }
}

/*--------------------------------------------------------------
# Breadcrumbs
--------------------------------------------------------------*/
.breadcrumbs {
  padding: 15px 0;
  background: #012970;
  min-height: 40px;
  margin-top: 82px;
  color: #fff;
}

@media (max-width: 992px) {
  .breadcrumbs {
    margin-top: 57px;
  }
}

.breadcrumbs h2 {
  font-size: 28px;
  font-weight: 500;
}

.breadcrumbs ol {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  padding: 0 0 10px 0;
  margin: 0;
  font-size: 14px;
}

.breadcrumbs ol a {
  color: #fff;
  transition: 0.3s;
}

.breadcrumbs ol a:hover {
  text-decoration: underline;
}

.breadcrumbs ol li+li {
  padding-left: 10px;
}

.breadcrumbs ol li+li::before {
  display: inline-block;
  padding-right: 10px;
  color: #8894f6;
  content: "/";
}

/*--------------------------------------------------------------
# Back to top button
--------------------------------------------------------------*/
.back-to-top {
  position: fixed;
  visibility: hidden;
  opacity: 0;
  right: 15px;
  bottom: 15px;
  z-index: 99999;
  background: #4154f1;
  width: 40px;
  height: 40px;
  border-radius: 4px;
  transition: all 0.4s;
}

.back-to-top i {
  font-size: 24px;
  color: #fff;
  line-height: 0;
}

.back-to-top:hover {
  background: #6776f4;
  color: #fff;
}

.back-to-top.active {
  visibility: visible;
  opacity: 1;
}

/*--------------------------------------------------------------
# Disable aos animation delay on mobile devices
--------------------------------------------------------------*/
@media screen and (max-width: 768px) {
  [data-aos-delay] {
    transition-delay: 0 !important;
  }
}

/*--------------------------------------------------------------
# Header
--------------------------------------------------------------*/
.header {
  transition: all 0.5s;
  z-index: 997;
  padding: 20px 0;
}

.header.header-scrolled {
  background: #fff;
  padding: 15px 0;
  box-shadow: 0px 2px 20px rgba(1, 41, 112, 0.1);
}

.header .logo {
  line-height: 0;
}

.header .logo img {
  max-height: 40px;
  margin-right: 6px;
}

.header .logo span {
  font-size: 30px;
  font-weight: 700;
  letter-spacing: 1px;
  color: #012970;
  font-family: "Nunito", sans-serif;
  margin-top: 3px;
}

/*--------------------------------------------------------------
# Navigation Menu
--------------------------------------------------------------*/
/**
* Desktop Navigation 
*/
.navbar {
  padding: 0;
}

.navbar ul {
  margin: 0;
  padding: 0;
  display: flex;
  list-style: none;
  align-items: center;
}

.navbar li {
  position: relative;
}

.navbar a,
.navbar a:focus {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px 0 10px 30px;
  font-family: "Nunito", sans-serif;
  font-size: 16px;
  font-weight: 700;
  color: #013289;
  white-space: nowrap;
  transition: 0.3s;
}

.navbar a i,
.navbar a:focus i {
  font-size: 12px;
  line-height: 0;
  margin-left: 5px;
}

.navbar a:hover,
.navbar .active,
.navbar .active:focus,
.navbar li:hover>a {
  color: #4154f1;
}

.navbar .getstarted,
.navbar .getstarted:focus {
  background: #4154f1;
  padding: 8px 20px;
  margin-left: 30px;
  border-radius: 4px;
  color: #fff;
}

.navbar .getstarted:hover,
.navbar .getstarted:focus:hover {
  color: #fff;
  background: #5969f3;
}

.navbar .dropdown ul {
  display: block;
  position: absolute;
  left: 14px;
  top: calc(100% + 30px);
  margin: 0;
  padding: 10px 0;
  z-index: 99;
  opacity: 0;
  visibility: hidden;
  background: #fff;
  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);
  transition: 0.3s;
  border-radius: 4px;
}

.navbar .dropdown ul li {
  min-width: 200px;
}

.navbar .dropdown ul a {
  padding: 10px 20px;
  font-size: 15px;
  text-transform: none;
  font-weight: 600;
}

.navbar .dropdown ul a i {
  font-size: 12px;
}

.navbar .dropdown ul a:hover,
.navbar .dropdown ul .active:hover,
.navbar .dropdown ul li:hover>a {
  color: #4154f1;
}

.navbar .dropdown:hover>ul {
  opacity: 1;
  top: 100%;
  visibility: visible;
}

.navbar .dropdown .dropdown ul {
  top: 0;
  left: calc(100% - 30px);
  visibility: hidden;
}

.navbar .dropdown .dropdown:hover>ul {
  opacity: 1;
  top: 0;
  left: 100%;
  visibility: visible;
}

@media (max-width: 1366px) {
  .navbar .dropdown .dropdown ul {
    left: -90%;
  }

  .navbar .dropdown .dropdown:hover>ul {
    left: -100%;
  }
}

/**
* Mobile Navigation 
*/
.mobile-nav-toggle {
  color: #012970;
  font-size: 28px;
  cursor: pointer;
  display: none;
  line-height: 0;
  transition: 0.5s;
}

.mobile-nav-toggle.bi-x {
  color: #fff;
}

@media (max-width: 991px) {
  .mobile-nav-toggle {
    display: block;
  }

  .navbar ul {
    display: none;
  }
}

.navbar-mobile {
  position: fixed;
  overflow: hidden;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  background: rgba(1, 22, 61, 0.9);
  transition: 0.3s;
}

.navbar-mobile .mobile-nav-toggle {
  position: absolute;
  top: 15px;
  right: 15px;
}

.navbar-mobile ul {
  display: block;
  position: absolute;
  top: 55px;
  right: 15px;
  bottom: 15px;
  left: 15px;
  padding: 10px 0;
  border-radius: 10px;
  background-color: #fff;
  overflow-y: auto;
  transition: 0.3s;
}

.navbar-mobile a,
.navbar-mobile a:focus {
  padding: 10px 20px;
  font-size: 15px;
  color: #012970;
}

.navbar-mobile a:hover,
.navbar-mobile .active,
.navbar-mobile li:hover>a {
  color: #4154f1;
}

.navbar-mobile .getstarted,
.navbar-mobile .getstarted:focus {
  margin: 15px;
}

.navbar-mobile .dropdown ul {
  position: static;
  display: none;
  margin: 10px 20px;
  padding: 10px 0;
  z-index: 99;
  opacity: 1;
  visibility: visible;
  background: #fff;
  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);
}

.navbar-mobile .dropdown ul li {
  min-width: 200px;
}

.navbar-mobile .dropdown ul a {
  padding: 10px 20px;
}

.navbar-mobile .dropdown ul a i {
  font-size: 12px;
}

.navbar-mobile .dropdown ul a:hover,
.navbar-mobile .dropdown ul .active:hover,
.navbar-mobile .dropdown ul li:hover>a {
  color: #4154f1;
}

.navbar-mobile .dropdown>.dropdown-active {
  display: block;
}

/*--------------------------------------------------------------
# Hero Section
--------------------------------------------------------------*/
.hero {
  width: 100%;
  height: 100vh;
  background: url(../img/hero-bg.png) top center no-repeat;
  background-size: cover;
}

.hero h1 {
  margin: 0;
  font-size: 48px;
  font-weight: 700;
  color: #012970;
}

.hero h2 {
  color: #444444;
  margin: 15px 0 0 0;
  font-size: 26px;
}

.hero .btn-get-started {
  margin-top: 30px;
  line-height: 0;
  padding: 15px 40px;
  border-radius: 4px;
  transition: 0.5s;
  color: #fff;
  background: #4154f1;
  box-shadow: 0px 5px 30px rgba(65, 84, 241, 0.4);
}

.hero .btn-get-started span {
  font-family: "Nunito", sans-serif;
  font-weight: 600;
  font-size: 16px;
  letter-spacing: 1px;
}

.hero .btn-get-started i {
  margin-left: 5px;
  font-size: 18px;
  transition: 0.3s;
}

.hero .btn-get-started:hover i {
  transform: translateX(5px);
}

.hero .btn-goto-dashboard {
  margin-top: 30px;
  line-height: 0;
  padding: 15px 40px;
  border-radius: 4px;
  transition: 0.5s;
  color: #fff;
  background: #000000;
  box-shadow: 0px 5px 30px rgba(65, 84, 241, 0.4);
}

.hero .btn-goto-dashboard span {
  font-family: "Nunito", sans-serif;
  font-weight: 600;
  font-size: 16px;
  letter-spacing: 1px;
}

.hero .btn-goto-dashboard i {
  margin-left: 5px;
  font-size: 18px;
  transition: 0.3s;
}

.hero .btn-goto-dashboard:hover i {
  transform: translateX(5px);
}

.hero .hero-img {
  text-align: right;
}

@media (min-width: 1024px) {
  .hero {
    background-attachment: fixed;
  }
}

@media (max-width: 991px) {
  .hero {
    height: auto;
    padding: 120px 0 60px 0;
  }

  .hero .hero-img {
    text-align: center;
    margin-top: 80px;
  }

  .hero .hero-img img {
    width: 80%;
  }
}

@media (max-width: 768px) {
  .hero {
    text-align: center;
  }

  .hero h1 {
    font-size: 32px;
  }

  .hero h2 {
    font-size: 24px;
  }

  .hero .hero-img img {
    width: 100%;
  }
}

/*--------------------------------------------------------------
# Index Page
--------------------------------------------------------------*/
/*--------------------------------------------------------------
# About
--------------------------------------------------------------*/
.about .content {
  background-color: #f6f9ff;
  padding: 40px;
}

.about h3 {
  font-size: 14px;
  font-weight: 700;
  color: #4154f1;
  text-transform: uppercase;
}

.about h2 {
  font-size: 24px;
  font-weight: 700;
  color: #012970;
}

.about p {
  margin: 15px 0 30px 0;
  line-height: 24px;
}

.about .btn-read-more {
  line-height: 0;
  padding: 15px 40px;
  border-radius: 4px;
  transition: 0.5s;
  color: #fff;
  background: #4154f1;
  box-shadow: 0px 5px 25px rgba(65, 84, 241, 0.3);
}

.about .btn-read-more span {
  font-family: "Nunito", sans-serif;
  font-weight: 600;
  font-size: 16px;
  letter-spacing: 1px;
}

.about .btn-read-more i {
  margin-left: 5px;
  font-size: 18px;
  transition: 0.3s;
}

.about .btn-read-more:hover i {
  transform: translateX(5px);
}

/*--------------------------------------------------------------
# Values
--------------------------------------------------------------*/
.values .box {
  padding: 30px;
  box-shadow: 0px 0 5px rgba(1, 41, 112, 0.08);
  text-align: center;
  transition: 0.3s;
  height: 100%;
}

.values .box img {
  padding: 30px 50px;
  transition: 0.5s;
  transform: scale(1.1);
}

.values .box h3 {
  font-size: 24px;
  color: #012970;
  font-weight: 700;
  margin-bottom: 18px;
}

.values .box:hover {
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
}

.values .box:hover img {
  transform: scale(1);
}

/*--------------------------------------------------------------
# Counts
--------------------------------------------------------------*/
.counts {
  padding: 70px 0 60px;
}

.counts .count-box {
  display: flex;
  align-items: center;
  padding: 30px;
  width: 100%;
  background: #fff;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
}

.counts .count-box i {
  font-size: 42px;
  line-height: 0;
  margin-right: 20px;
  color: #4154f1;
}

.counts .count-box span {
  font-size: 36px;
  display: block;
  font-weight: 600;
  color: #0b198f;
}

.counts .count-box p {
  padding: 0;
  margin: 0;
  font-family: "Nunito", sans-serif;
  font-size: 14px;
}

/*--------------------------------------------------------------
# Features
--------------------------------------------------------------*/
.features .feature-box {
  padding: 24px 20px;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
  transition: 0.3s;
  height: 100%;
}

.features .feature-box h3 {
  font-size: 18px;
  color: #012970;
  font-weight: 700;
  margin: 0;
}

.features .feature-box i {
  line-height: 0;
  background: #ecf3ff;
  padding: 4px;
  margin-right: 10px;
  font-size: 24px;
  border-radius: 3px;
  transition: 0.3s;
}

.features .feature-box:hover i {
  background: #4154f1;
  color: #fff;
}

.features .feture-tabs {
  margin-top: 120px;
}

.features .feture-tabs h3 {
  color: #012970;
  font-weight: 700;
  font-size: 32px;
  margin-bottom: 10px;
}

@media (max-width: 768px) {
  .features .feture-tabs h3 {
    font-size: 28px;
  }
}

.features .feture-tabs .nav-pills {
  border-bottom: 1px solid #eee;
}

.features .feture-tabs .nav-link {
  background: none;
  text-transform: uppercase;
  font-size: 15px;
  font-weight: 600;
  color: #012970;
  padding: 12px 0;
  margin-right: 25px;
  margin-bottom: -2px;
  border-radius: 0;
}

.features .feture-tabs .nav-link.active {
  color: #4154f1;
  border-bottom: 3px solid #4154f1;
}

.features .feture-tabs .tab-content h4 {
  font-size: 18px;
  margin: 0;
  font-weight: 700;
  color: #012970;
}

.features .feture-tabs .tab-content i {
  font-size: 24px;
  line-height: 0;
  margin-right: 8px;
  color: #4154f1;
}

.features .feature-icons {
  margin-top: 120px;
}

.features .feature-icons h3 {
  color: #012970;
  font-weight: 700;
  font-size: 32px;
  margin-bottom: 20px;
  text-align: center;
}

@media (max-width: 768px) {
  .features .feature-icons h3 {
    font-size: 28px;
  }
}

.features .feature-icons .content .icon-box {
  display: flex;
}

.features .feature-icons .content .icon-box h4 {
  font-size: 20px;
  font-weight: 700;
  margin: 0 0 10px 0;
  color: #012970;
}

.features .feature-icons .content .icon-box i {
  font-size: 44px;
  line-height: 44px;
  color: #0245bc;
  margin-right: 15px;
}

.features .feature-icons .content .icon-box p {
  font-size: 15px;
  color: #848484;
}

/*--------------------------------------------------------------
# Services
--------------------------------------------------------------*/
.services .service-box {
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
  height: 100%;
  padding: 60px 30px;
  text-align: center;
  transition: 0.3s;
  border-radius: 5px;
}

.services .service-box .icon {
  font-size: 36px;
  padding: 40px 20px;
  border-radius: 4px;
  position: relative;
  margin-bottom: 25px;
  display: inline-block;
  line-height: 0;
  transition: 0.3s;
}

.services .service-box h3 {
  color: #444444;
  font-weight: 700;
}

.services .service-box .read-more {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  font-weight: 600;
  font-size: 16px;
  padding: 8px 20px;
}

.services .service-box .read-more i {
  line-height: 0;
  margin-left: 5px;
  font-size: 18px;
}

.services .service-box.blue {
  border-bottom: 3px solid #2db6fa;
}

.services .service-box.blue .icon {
  color: #2db6fa;
  background: #dbf3fe;
}

.services .service-box.blue .read-more {
  color: #2db6fa;
}

.services .service-box.blue:hover {
  background: #2db6fa;
}

.services .service-box.orange {
  border-bottom: 3px solid #f68c09;
}

.services .service-box.orange .icon {
  color: #f68c09;
  background: #fde3c4;
}

.services .service-box.orange .read-more {
  color: #f68c09;
}

.services .service-box.orange:hover {
  background: #f68c09;
}

.services .service-box.green {
  border-bottom: 3px solid #08da4e;
}

.services .service-box.green .icon {
  color: #08da4e;
  background: #cffddf;
}

.services .service-box.green .read-more {
  color: #08da4e;
}

.services .service-box.green:hover {
  background: #08da4e;
}

.services .service-box.red {
  border-bottom: 3px solid #e9222c;
}

.services .service-box.red .icon {
  color: #e9222c;
  background: #fef7f8;
}

.services .service-box.red .read-more {
  color: #e9222c;
}

.services .service-box.red:hover {
  background: #e9222c;
}

.services .service-box.purple {
  border-bottom: 3px solid #b50edf;
}

.services .service-box.purple .icon {
  color: #b50edf;
  background: #f8e4fd;
}

.services .service-box.purple .read-more {
  color: #b50edf;
}

.services .service-box.purple:hover {
  background: #b50edf;
}

.services .service-box.pink {
  border-bottom: 3px solid #f51f9c;
}

.services .service-box.pink .icon {
  color: #f51f9c;
  background: #feecf7;
}

.services .service-box.pink .read-more {
  color: #f51f9c;
}

.services .service-box.pink:hover {
  background: #f51f9c;
}

.services .service-box:hover h3,
.services .service-box:hover p,
.services .service-box:hover .read-more {
  color: #fff;
}

.services .service-box:hover .icon {
  background: #fff;
}

/*--------------------------------------------------------------
# Pricing
--------------------------------------------------------------*/
.pricing .box {
  padding: 40px 20px;
  background: #fff;
  text-align: center;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
  border-radius: 4px;
  position: relative;
  overflow: hidden;
  transition: 0.3s;
}

.pricing .box:hover {
  transform: scale(1.1);
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
}

.pricing h3 {
  font-weight: 700;
  font-size: 18px;
  margin-bottom: 15px;
}

.pricing .price {
  font-size: 36px;
  color: #444444;
  font-weight: 600;
  font-family: "Poppins", sans-serif;
}

.pricing .price sup {
  font-size: 20px;
  top: -15px;
  left: -3px;
}

.pricing .price span {
  color: #bababa;
  font-size: 16px;
  font-weight: 300;
}

.pricing img {
  padding: 30px 40px;
}

.pricing ul {
  padding: 0;
  list-style: none;
  color: #444444;
  text-align: center;
  line-height: 26px;
  font-size: 16px;
  margin-bottom: 25px;
}

.pricing ul li {
  padding-bottom: 10px;
}

.pricing ul .na {
  color: #ccc;
  text-decoration: line-through;
}

.pricing .btn-buy {
  display: inline-block;
  padding: 8px 40px 10px 40px;
  border-radius: 50px;
  color: #4154f1;
  transition: none;
  font-size: 16px;
  font-weight: 400;
  font-family: "Nunito", sans-serif;
  font-weight: 600;
  transition: 0.3s;
  border: 1px solid #4154f1;
}

.pricing .btn-buy:hover {
  background: #4154f1;
  color: #fff;
}

.pricing .featured {
  width: 200px;
  position: absolute;
  top: 18px;
  right: -68px;
  transform: rotate(45deg);
  z-index: 1;
  font-size: 14px;
  padding: 1px 0 3px 0;
  background: #4154f1;
  color: #fff;
}

/*--------------------------------------------------------------
# F.A.Q
--------------------------------------------------------------*/
.faq .accordion-collapse {
  border: 0;
}

.faq .accordion-button {
  padding: 15px 15px 20px 0;
  font-weight: 600;
  border: 0;
  font-size: 18px;
  color: #444444;
  text-align: left;
}

.faq .accordion-button:focus {
  box-shadow: none;
}

.faq .accordion-button:not(.collapsed) {
  background: none;
  color: #4154f1;
  border-bottom: 0;
}

.faq .accordion-body {
  padding: 0 0 25px 0;
  border: 0;
}

/*--------------------------------------------------------------
# Portfolio
--------------------------------------------------------------*/
.portfolio #portfolio-flters {
  padding: 0;
  margin: 0 auto 25px auto;
  list-style: none;
  text-align: center;
  background: white;
  border-radius: 50px;
  padding: 2px 15px;
}

.portfolio #portfolio-flters li {
  cursor: pointer;
  display: inline-block;
  padding: 8px 20px 10px 20px;
  font-size: 15px;
  font-weight: 600;
  line-height: 1;
  color: #444444;
  margin: 0 4px 8px 4px;
  transition: 0.3s;
  border-radius: 50px;
  border: 1px solid #fff;
}

.portfolio #portfolio-flters li:hover,
.portfolio #portfolio-flters li.filter-active {
  color: #4154f1;
  border-color: #4154f1;
}

.portfolio #portfolio-flters li:last-child {
  margin-right: 0;
}

.portfolio .portfolio-wrap {
  transition: 0.3s;
  position: relative;
  overflow: hidden;
  z-index: 1;
  background: rgba(255, 255, 255, 0.75);
}

.portfolio .portfolio-wrap::before {
  content: "";
  background: rgba(255, 255, 255, 0.75);
  position: absolute;
  left: 30px;
  right: 30px;
  top: 30px;
  bottom: 30px;
  transition: all ease-in-out 0.3s;
  z-index: 2;
  opacity: 0;
}

.portfolio .portfolio-wrap img {
  transition: 1s;
}

.portfolio .portfolio-wrap .portfolio-info {
  opacity: 0;
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  text-align: center;
  z-index: 3;
  transition: all ease-in-out 0.3s;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.portfolio .portfolio-wrap .portfolio-info::before {
  display: block;
  content: "";
  width: 48px;
  height: 48px;
  position: absolute;
  top: 35px;
  left: 35px;
  border-top: 3px solid rgba(1, 41, 112, 0.2);
  border-left: 3px solid rgba(1, 41, 112, 0.2);
  transition: all 0.5s ease 0s;
  z-index: 9994;
}

.portfolio .portfolio-wrap .portfolio-info::after {
  display: block;
  content: "";
  width: 48px;
  height: 48px;
  position: absolute;
  bottom: 35px;
  right: 35px;
  border-bottom: 3px solid rgba(1, 41, 112, 0.2);
  border-right: 3px solid rgba(1, 41, 112, 0.2);
  transition: all 0.5s ease 0s;
  z-index: 9994;
}

.portfolio .portfolio-wrap .portfolio-info h4 {
  font-size: 20px;
  color: #012970;
  font-weight: 700;
}

.portfolio .portfolio-wrap .portfolio-info p {
  color: #012970;
  font-weight: 600;
  font-size: 14px;
  text-transform: uppercase;
  padding: 0;
  margin: 0;
}

.portfolio .portfolio-wrap .portfolio-links {
  text-align: center;
  z-index: 4;
}

.portfolio .portfolio-wrap .portfolio-links a {
  color: #fff;
  background: #4154f1;
  margin: 10px 2px;
  width: 36px;
  height: 36px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: 0.3s;
}

.portfolio .portfolio-wrap .portfolio-links a i {
  font-size: 24px;
  line-height: 0;
}

.portfolio .portfolio-wrap .portfolio-links a:hover {
  background: #5969f3;
}

.portfolio .portfolio-wrap:hover img {
  transform: scale(1.1);
}

.portfolio .portfolio-wrap:hover::before {
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  opacity: 1;
}

.portfolio .portfolio-wrap:hover .portfolio-info {
  opacity: 1;
}

.portfolio .portfolio-wrap:hover .portfolio-info::before {
  top: 15px;
  left: 15px;
}

.portfolio .portfolio-wrap:hover .portfolio-info::after {
  bottom: 15px;
  right: 15px;
}

/*--------------------------------------------------------------
# Portfolio Details
--------------------------------------------------------------*/
.portfolio-details {
  padding-top: 40px;
}

.portfolio-details .portfolio-details-slider img {
  width: 100%;
}

.portfolio-details .portfolio-details-slider .swiper-pagination {
  margin-top: 20px;
  position: relative;
}

.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet {
  width: 12px;
  height: 12px;
  background-color: #fff;
  opacity: 1;
  border: 1px solid #4154f1;
}

.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet-active {
  background-color: #4154f1;
}

.portfolio-details .portfolio-info {
  padding: 30px;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
}

.portfolio-details .portfolio-info h3 {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #eee;
}

.portfolio-details .portfolio-info ul {
  list-style: none;
  padding: 0;
  font-size: 15px;
}

.portfolio-details .portfolio-info ul li+li {
  margin-top: 10px;
}

.portfolio-details .portfolio-description {
  padding-top: 30px;
}

.portfolio-details .portfolio-description h2 {
  font-size: 26px;
  font-weight: 700;
  margin-bottom: 20px;
}

.portfolio-details .portfolio-description p {
  padding: 0;
}

/*--------------------------------------------------------------
# Testimonials
--------------------------------------------------------------*/
.testimonials .testimonial-item {
  box-sizing: content-box;
  padding: 30px;
  margin: 40px 30px;
  box-shadow: 0px 0 20px rgba(1, 41, 112, 0.1);
  background: #fff;
  min-height: 320px;
  display: flex;
  flex-direction: column;
  text-align: center;
  transition: 0.3s;
}

.testimonials .testimonial-item .stars {
  margin-bottom: 15px;
}

.testimonials .testimonial-item .stars i {
  color: #ffc107;
  margin: 0 1px;
}

.testimonials .testimonial-item .testimonial-img {
  width: 90px;
  border-radius: 50%;
  border: 4px solid #fff;
  margin: 0 auto;
}

.testimonials .testimonial-item h3 {
  font-size: 18px;
  font-weight: bold;
  margin: 10px 0 5px 0;
  color: #111;
}

.testimonials .testimonial-item h4 {
  font-size: 14px;
  color: #999;
  margin: 0;
}

.testimonials .testimonial-item p {
  font-style: italic;
  margin: 0 auto 15px auto;
}

.testimonials .swiper-pagination {
  margin-top: 20px;
  position: relative;
}

.testimonials .swiper-pagination .swiper-pagination-bullet {
  width: 12px;
  height: 12px;
  background-color: #fff;
  opacity: 1;
  border: 1px solid #4154f1;
}

.testimonials .swiper-pagination .swiper-pagination-bullet-active {
  background-color: #4154f1;
}

.testimonials .swiper-slide {
  opacity: 0.3;
}

@media (max-width: 1199px) {
  .testimonials .swiper-slide-active {
    opacity: 1;
  }

  .testimonials .swiper-pagination {
    margin-top: 0;
  }
}

@media (min-width: 1200px) {
  .testimonials .swiper-slide-next {
    opacity: 1;
    transform: scale(1.12);
  }
}

/*--------------------------------------------------------------
# Team
--------------------------------------------------------------*/
.team {
  background: #fff;
  padding: 60px 0;
}

.team .member {
  overflow: hidden;
  text-align: center;
  border-radius: 5px;
  background: #fff;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
  transition: 0.3s;
}

.team .member .member-img {
  position: relative;
  overflow: hidden;
}

.team .member .member-img:after {
  position: absolute;
  content: "";
  left: 0;
  bottom: 0;
  height: 100%;
  width: 100%;
  background: url(../img/team-shape.svg) no-repeat center bottom;
  background-size: contain;
  z-index: 1;
}

.team .member .social {
  position: absolute;
  right: -100%;
  top: 30px;
  opacity: 0;
  border-radius: 4px;
  transition: 0.5s;
  background: rgba(255, 255, 255, 0.3);
  z-index: 2;
}

.team .member .social a {
  transition: color 0.3s;
  color: rgba(1, 41, 112, 0.5);
  margin: 15px 12px;
  display: block;
  line-height: 0;
  text-align: center;
}

.team .member .social a:hover {
  color: rgba(1, 41, 112, 0.8);
}

.team .member .social i {
  font-size: 18px;
}

.team .member .member-info {
  padding: 10px 15px 20px 15px;
}

.team .member .member-info h4 {
  font-weight: 700;
  margin-bottom: 5px;
  font-size: 20px;
  color: #012970;
}

.team .member .member-info span {
  display: block;
  font-size: 14px;
  font-weight: 400;
  color: #aaaaaa;
}

.team .member .member-info p {
  font-style: italic;
  font-size: 14px;
  padding-top: 15px;
  line-height: 26px;
  color: #5e5e5e;
}

.team .member:hover {
  transform: scale(1.08);
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
}

.team .member:hover .social {
  right: 8px;
  opacity: 1;
}

/*--------------------------------------------------------------
# Clients
--------------------------------------------------------------*/
.clients .clients-slider .swiper-slide img {
  opacity: 0.5;
  transition: 0.3s;
}

.clients .clients-slider .swiper-slide img:hover {
  opacity: 1;
}

.clients .clients-slider .swiper-pagination {
  margin-top: 20px;
  position: relative;
}

.clients .clients-slider .swiper-pagination .swiper-pagination-bullet {
  width: 12px;
  height: 12px;
  background-color: #fff;
  opacity: 1;
  border: 1px solid #4154f1;
}

.clients .clients-slider .swiper-pagination .swiper-pagination-bullet-active {
  background-color: #4154f1;
}

/*--------------------------------------------------------------
# Recent Blog Posts
--------------------------------------------------------------*/
.recent-blog-posts .post-box {
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.08);
  transition: 0.3s;
  height: 100%;
  overflow: hidden;
  padding: 30px;
  border-radius: 8px;
  position: relative;
  display: flex;
  flex-direction: column;
}

.recent-blog-posts .post-box .post-img {
  overflow: hidden;
  margin: -30px -30px 15px -30px;
  position: relative;
}

.recent-blog-posts .post-box .post-img img {
  transition: 0.5s;
}

.recent-blog-posts .post-box .post-date {
  font-size: 16px;
  font-weight: 600;
  color: rgba(1, 41, 112, 0.6);
  display: block;
  margin-bottom: 10px;
}

.recent-blog-posts .post-box .post-title {
  font-size: 24px;
  color: #012970;
  font-weight: 700;
  margin-bottom: 18px;
  position: relative;
  transition: 0.3s;
}

.recent-blog-posts .post-box .readmore {
  display: flex;
  align-items: center;
  font-weight: 600;
  line-height: 1;
  transition: 0.3s;
}

.recent-blog-posts .post-box .readmore i {
  line-height: 0;
  margin-left: 4px;
  font-size: 18px;
}

.recent-blog-posts .post-box:hover .post-title {
  color: #4154f1;
}

.recent-blog-posts .post-box:hover .post-img img {
  transform: rotate(6deg) scale(1.2);
}

/*--------------------------------------------------------------
# Contact
--------------------------------------------------------------*/
.contact .info-box {
  color: #444444;
  background: #fafbff;
  padding: 30px;
}

.contact .info-box i {
  font-size: 38px;
  line-height: 0;
  color: #4154f1;
}

.contact .info-box h3 {
  font-size: 20px;
  color: #012970;
  font-weight: 700;
  margin: 20px 0 10px 0;
}

.contact .info-box p {
  padding: 0;
  line-height: 24px;
  font-size: 14px;
  margin-bottom: 0;
}

.contact .php-email-form {
  background: #fafbff;
  padding: 30px;
  height: 100%;
}

.contact .php-email-form .error-message {
  display: none;
  color: #fff;
  background: #ed3c0d;
  text-align: left;
  padding: 15px;
  margin-bottom: 24px;
  font-weight: 600;
}

.contact .php-email-form .sent-message {
  display: none;
  color: #fff;
  background: #18d26e;
  text-align: center;
  padding: 15px;
  margin-bottom: 24px;
  font-weight: 600;
}

.contact .php-email-form .loading {
  display: none;
  background: #fff;
  text-align: center;
  padding: 15px;
  margin-bottom: 24px;
}

.contact .php-email-form .loading:before {
  content: "";
  display: inline-block;
  border-radius: 50%;
  width: 24px;
  height: 24px;
  margin: 0 10px -6px 0;
  border: 3px solid #18d26e;
  border-top-color: #eee;
  -webkit-animation: animate-loading 1s linear infinite;
  animation: animate-loading 1s linear infinite;
}

.contact .php-email-form input,
.contact .php-email-form textarea {
  border-radius: 0;
  box-shadow: none;
  font-size: 14px;
  border-radius: 0;
}

.contact .php-email-form input:focus,
.contact .php-email-form textarea:focus {
  border-color: #4154f1;
}

.contact .php-email-form input {
  padding: 10px 15px;
}

.contact .php-email-form textarea {
  padding: 12px 15px;
}

.contact .php-email-form button[type=submit] {
  background: #4154f1;
  border: 0;
  padding: 10px 30px;
  color: #fff;
  transition: 0.4s;
  border-radius: 4px;
}

.contact .php-email-form button[type=submit]:hover {
  background: #5969f3;
}

@-webkit-keyframes animate-loading {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}

@keyframes animate-loading {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}

/*--------------------------------------------------------------
# Blog
--------------------------------------------------------------*/
.blog {
  padding: 40px 0 20px 0;
}

.blog .entry {
  padding: 30px;
  margin-bottom: 60px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.blog .entry .entry-img {
  max-height: 440px;
  margin: -30px -30px 20px -30px;
  overflow: hidden;
}

.blog .entry .entry-title {
  font-size: 28px;
  font-weight: bold;
  padding: 0;
  margin: 0 0 20px 0;
}

.blog .entry .entry-title a {
  color: #012970;
  transition: 0.3s;
}

.blog .entry .entry-title a:hover {
  color: #4154f1;
}

.blog .entry .entry-meta {
  margin-bottom: 15px;
  color: #4084fd;
}

.blog .entry .entry-meta ul {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  align-items: center;
  padding: 0;
  margin: 0;
}

.blog .entry .entry-meta ul li+li {
  padding-left: 20px;
}

.blog .entry .entry-meta i {
  font-size: 16px;
  margin-right: 8px;
  line-height: 0;
}

.blog .entry .entry-meta a {
  color: #777777;
  font-size: 14px;
  display: inline-block;
  line-height: 1;
}

.blog .entry .entry-content p {
  line-height: 24px;
}

.blog .entry .entry-content .read-more {
  -moz-text-align-last: right;
  text-align-last: right;
}

.blog .entry .entry-content .read-more a {
  display: inline-block;
  background: #4154f1;
  color: #fff;
  padding: 6px 20px;
  transition: 0.3s;
  font-size: 14px;
  border-radius: 4px;
}

.blog .entry .entry-content .read-more a:hover {
  background: #5969f3;
}

.blog .entry .entry-content h3 {
  font-size: 22px;
  margin-top: 30px;
  font-weight: bold;
}

.blog .entry .entry-content blockquote {
  overflow: hidden;
  background-color: #fafafa;
  padding: 60px;
  position: relative;
  text-align: center;
  margin: 20px 0;
}

.blog .entry .entry-content blockquote p {
  color: #444444;
  line-height: 1.6;
  margin-bottom: 0;
  font-style: italic;
  font-weight: 500;
  font-size: 22px;
}

.blog .entry .entry-content blockquote::after {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  width: 3px;
  background-color: #012970;
  margin-top: 20px;
  margin-bottom: 20px;
}

.blog .entry .entry-footer {
  padding-top: 10px;
  border-top: 1px solid #e6e6e6;
}

.blog .entry .entry-footer i {
  color: #0d64fd;
  display: inline;
}

.blog .entry .entry-footer a {
  color: #013289;
  transition: 0.3s;
}

.blog .entry .entry-footer a:hover {
  color: #4154f1;
}

.blog .entry .entry-footer .cats {
  list-style: none;
  display: inline;
  padding: 0 20px 0 0;
  font-size: 14px;
}

.blog .entry .entry-footer .cats li {
  display: inline-block;
}

.blog .entry .entry-footer .tags {
  list-style: none;
  display: inline;
  padding: 0;
  font-size: 14px;
}

.blog .entry .entry-footer .tags li {
  display: inline-block;
}

.blog .entry .entry-footer .tags li+li::before {
  padding-right: 6px;
  color: #6c757d;
  content: ",";
}

.blog .entry .entry-footer .share {
  font-size: 16px;
}

.blog .entry .entry-footer .share i {
  padding-left: 5px;
}

.blog .entry-single {
  margin-bottom: 30px;
}

.blog .blog-author {
  padding: 20px;
  margin-bottom: 30px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.blog .blog-author img {
  width: 120px;
  margin-right: 20px;
}

.blog .blog-author h4 {
  font-weight: 600;
  font-size: 22px;
  margin-bottom: 0px;
  padding: 0;
  color: #012970;
}

.blog .blog-author .social-links {
  margin: 0 10px 10px 0;
}

.blog .blog-author .social-links a {
  color: rgba(1, 41, 112, 0.5);
  margin-right: 5px;
}

.blog .blog-author p {
  font-style: italic;
  color: #b7b7b7;
}

.blog .blog-comments {
  margin-bottom: 30px;
}

.blog .blog-comments .comments-count {
  font-weight: bold;
}

.blog .blog-comments .comment {
  margin-top: 30px;
  position: relative;
}

.blog .blog-comments .comment .comment-img {
  margin-right: 14px;
}

.blog .blog-comments .comment .comment-img img {
  width: 60px;
}

.blog .blog-comments .comment h5 {
  font-size: 16px;
  margin-bottom: 2px;
}

.blog .blog-comments .comment h5 a {
  font-weight: bold;
  color: #444444;
  transition: 0.3s;
}

.blog .blog-comments .comment h5 a:hover {
  color: #4154f1;
}

.blog .blog-comments .comment h5 .reply {
  padding-left: 10px;
  color: #012970;
}

.blog .blog-comments .comment h5 .reply i {
  font-size: 20px;
}

.blog .blog-comments .comment time {
  display: block;
  font-size: 14px;
  color: #013ca3;
  margin-bottom: 5px;
}

.blog .blog-comments .comment.comment-reply {
  padding-left: 40px;
}

.blog .blog-comments .reply-form {
  margin-top: 30px;
  padding: 30px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.blog .blog-comments .reply-form h4 {
  font-weight: bold;
  font-size: 22px;
}

.blog .blog-comments .reply-form p {
  font-size: 14px;
}

.blog .blog-comments .reply-form input {
  border-radius: 4px;
  padding: 10px 10px;
  font-size: 14px;
}

.blog .blog-comments .reply-form input:focus {
  box-shadow: none;
  border-color: #a0aaf8;
}

.blog .blog-comments .reply-form textarea {
  border-radius: 4px;
  padding: 10px 10px;
  font-size: 14px;
}

.blog .blog-comments .reply-form textarea:focus {
  box-shadow: none;
  border-color: #a0aaf8;
}

.blog .blog-comments .reply-form .form-group {
  margin-bottom: 25px;
}

.blog .blog-comments .reply-form .btn-primary {
  border-radius: 4px;
  padding: 10px 20px;
  border: 0;
  background-color: #012970;
}

.blog .blog-comments .reply-form .btn-primary:hover {
  background-color: #013289;
}

.blog .blog-pagination {
  color: #024ed5;
}

.blog .blog-pagination ul {
  display: flex;
  padding: 0;
  margin: 0;
  list-style: none;
}

.blog .blog-pagination li {
  margin: 0 5px;
  transition: 0.3s;
}

.blog .blog-pagination li a {
  color: #012970;
  padding: 7px 16px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.blog .blog-pagination li.active,
.blog .blog-pagination li:hover {
  background: #4154f1;
}

.blog .blog-pagination li.active a,
.blog .blog-pagination li:hover a {
  color: #fff;
}

.blog .sidebar {
  padding: 30px;
  margin: 0 0 60px 20px;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.blog .sidebar .sidebar-title {
  font-size: 20px;
  font-weight: 700;
  padding: 0 0 0 0;
  margin: 0 0 15px 0;
  color: #012970;
  position: relative;
}

.blog .sidebar .sidebar-item {
  margin-bottom: 30px;
}

.blog .sidebar .search-form form {
  background: #fff;
  border: 1px solid #ddd;
  padding: 3px 10px;
  position: relative;
}

.blog .sidebar .search-form form input[type=text] {
  border: 0;
  padding: 4px;
  border-radius: 4px;
  width: calc(100% - 40px);
}

.blog .sidebar .search-form form button {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  border: 0;
  background: none;
  font-size: 16px;
  padding: 0 15px;
  margin: -1px;
  background: #4154f1;
  color: #fff;
  transition: 0.3s;
  border-radius: 0 4px 4px 0;
  line-height: 0;
}

.blog .sidebar .search-form form button i {
  line-height: 0;
}

.blog .sidebar .search-form form button:hover {
  background: #5465f2;
}

.blog .sidebar .categories ul {
  list-style: none;
  padding: 0;
}

.blog .sidebar .categories ul li+li {
  padding-top: 10px;
}

.blog .sidebar .categories ul a {
  color: #012970;
  transition: 0.3s;
}

.blog .sidebar .categories ul a:hover {
  color: #4154f1;
}

.blog .sidebar .categories ul a span {
  padding-left: 5px;
  color: #aaaaaa;
  font-size: 14px;
}

.blog .sidebar .recent-posts .post-item+.post-item {
  margin-top: 15px;
}

.blog .sidebar .recent-posts img {
  width: 80px;
  float: left;
}

.blog .sidebar .recent-posts h4 {
  font-size: 15px;
  margin-left: 95px;
  font-weight: bold;
}

.blog .sidebar .recent-posts h4 a {
  color: #012970;
  transition: 0.3s;
}

.blog .sidebar .recent-posts h4 a:hover {
  color: #4154f1;
}

.blog .sidebar .recent-posts time {
  display: block;
  margin-left: 95px;
  font-style: italic;
  font-size: 14px;
  color: #aaaaaa;
}

.blog .sidebar .tags {
  margin-bottom: -10px;
}

.blog .sidebar .tags ul {
  list-style: none;
  padding: 0;
}

.blog .sidebar .tags ul li {
  display: inline-block;
}

.blog .sidebar .tags ul a {
  color: #0257ee;
  font-size: 14px;
  padding: 6px 14px;
  margin: 0 6px 8px 0;
  border: 1px solid #d7e6ff;
  display: inline-block;
  transition: 0.3s;
}

.blog .sidebar .tags ul a:hover {
  color: #fff;
  border: 1px solid #4154f1;
  background: #4154f1;
}

.blog .sidebar .tags ul a span {
  padding-left: 5px;
  color: #a5c5fe;
  font-size: 14px;
}

/*--------------------------------------------------------------
# Footer
--------------------------------------------------------------*/
.footer {
  background: #f6f9ff;
  padding: 0 0 30px 0;
  font-size: 14px;
}

.footer .footer-newsletter {
  padding: 50px 0;
  background: #f6f9ff;
  border-top: 1px solid #e1ecff;
}

.footer .footer-newsletter h4 {
  font-size: 24px;
  margin: 0 0 10px 0;
  padding: 0;
  line-height: 1;
  font-weight: 700;
  color: #012970;
}

.footer .footer-newsletter form {
  margin-top: 20px;
  background: #fff;
  padding: 6px 10px;
  position: relative;
  border-radius: 4px;
  border: 1px solid #e1ecff;
}

.footer .footer-newsletter form input[type=email] {
  border: 0;
  padding: 8px;
  width: calc(100% - 140px);
}

.footer .footer-newsletter form input[type=submit] {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  border: 0;
  background: none;
  font-size: 16px;
  padding: 0 30px;
  margin: 3px;
  background: #4154f1;
  color: #fff;
  transition: 0.3s;
  border-radius: 4px;
}

.footer .footer-newsletter form input[type=submit]:hover {
  background: #5969f3;
}

.footer .footer-top {
  background: white url(../img/footer-bg.png) no-repeat right top;
  background-size: contain;
  border-top: 1px solid #e1ecff;
  border-bottom: 1px solid #e1ecff;
  padding: 60px 0 30px 0;
}

@media (max-width: 992px) {
  .footer .footer-top {
    background-position: center bottom;
  }
}

.footer .footer-top .footer-info {
  margin-bottom: 30px;
}

.footer .footer-top .footer-info .logo {
  line-height: 0;
  margin-bottom: 15px;
}

.footer .footer-top .footer-info .logo img {
  max-height: 40px;
  margin-right: 6px;
}

.footer .footer-top .footer-info .logo span {
  font-size: 30px;
  font-weight: 700;
  letter-spacing: 1px;
  color: #012970;
  font-family: "Nunito", sans-serif;
  margin-top: 3px;
}

.footer .footer-top .footer-info p {
  font-size: 14px;
  line-height: 24px;
  margin-bottom: 0;
  font-family: "Nunito", sans-serif;
}

.footer .footer-top .social-links a {
  font-size: 20px;
  display: inline-block;
  color: rgba(1, 41, 112, 0.5);
  line-height: 0;
  margin-right: 10px;
  transition: 0.3s;
}

.footer .footer-top .social-links a:hover {
  color: #012970;
}

.footer .footer-top h4 {
  font-size: 16px;
  font-weight: bold;
  color: #012970;
  text-transform: uppercase;
  position: relative;
  padding-bottom: 12px;
}

.footer .footer-top .footer-links {
  margin-bottom: 30px;
}

.footer .footer-top .footer-links ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer .footer-top .footer-links ul i {
  padding-right: 2px;
  color: #d0d4fc;
  font-size: 12px;
  line-height: 0;
}

.footer .footer-top .footer-links ul li {
  padding: 10px 0;
  display: flex;
  align-items: center;
}

.footer .footer-top .footer-links ul li:first-child {
  padding-top: 0;
}

.footer .footer-top .footer-links ul a {
  color: #013289;
  transition: 0.3s;
  display: inline-block;
  line-height: 1;
}

.footer .footer-top .footer-links ul a:hover {
  color: #4154f1;
}

.footer .footer-top .footer-contact p {
  line-height: 26px;
}

.footer .copyright {
  text-align: center;
  padding-top: 30px;
  color: #012970;
}

.footer .credits {
  padding-top: 10px;
  text-align: center;
  font-size: 13px;
  color: #012970;
} 
</style>

<!-- =======================================================
  * Template Name: FlexStart - v1.11.0
  * Template URL: https://bootstrapmade.com/flexstart-bootstrap-startup-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="hero d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div class="col-lg-6 d-flex flex-column justify-content-center">
					<h1 data-aos="fade-up">We offer modern solutions for creating
						your portfolio</h1>
					<h2 data-aos="fade-up" data-aos-delay="400">We are team of
						talented designers making websites</h2>
					<div data-aos="fade-up" data-aos-delay="600">
						<div class="text-center text-lg-start mb-1">
							<button onclick="checkCookie('<%= cv %>')"
								class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
								<span>Get Started</span> <i class="bi bi-arrow-right"></i>
							</button>
							
							
						</div>
					<!-- 	<div class="text-center text-lg-start">
							<a href="admin/index.jsp"
								class="btn-goto-dashboard scrollto d-inline-flex align-items-center justify-content-center align-self-center">
								<span>Dashboard</span> <i class="bi bi-arrow-right"></i>
							</a>
						</div> -->
					</div>
				</div>
				<div class="col-lg-6 hero-img" data-aos="zoom-out"
					data-aos-delay="200">
					<img src="assets/img/hero-img.png" class="img-fluid" alt="">
				</div>
			</div>
		</div>

	</section>
	<!-- End Hero -->

	<!-- Vendor JS Files -->
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<script>

    (function() {
      "use strict";
    
      /**
       * Animation on scroll
       */
      function aos_init() {
        AOS.init({
          duration: 1000,
          easing: "ease-in-out",
          once: true,
          mirror: false
        });
      }
      window.addEventListener('load', () => {
        aos_init();
      });
    
    })();
    
    function checkCookie(s) {
    	  if(s==''){
    		  window.location.href = "admin/login.jsp";
    	  }
    	  else{
    		  window.location.href = "admin/index.jsp";
    	  }
    	  
    	}
      </script>



</body>

</html>