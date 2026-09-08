<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Corporate Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:url('https://images.unsplash.com/photo-1497366754035-f200968a6e72') no-repeat center center/cover;
}

.container{
    width:380px;
    padding:35px;
    border-radius:20px;
    background:rgba(0,0,0,0.6);
    backdrop-filter:blur(12px);
    color:white;
    text-align:center;
    box-shadow:0 0 20px rgba(0,0,0,0.5);
}

.logo{
    font-size:50px;
    margin-bottom:10px;
}

h2{
    margin-bottom:10px;
}

p{
    margin-bottom:25px;
    color:#ddd;
}

.input-group{
    margin-bottom:15px;
}

.input-group input{
    width:100%;
    padding:14px;
    border:none;
    border-radius:8px;
    outline:none;
    background:rgba(255,255,255,0.15);
    color:white;
}

.input-group input::placeholder{
    color:#ddd;
}

.btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:8px;
    background:#00c853;
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#00a844;
}

.links{
    margin-top:15px;
}

.links a{
    color:#66d9ff;
    text-decoration:none;
}

.footer{
    margin-top:20px;
    font-size:12px;
    color:#ccc;
}

</style>

</head>
<body>

<div class="container">

    <div class="logo">🏢</div>

    <h2>Corporate Portal</h2>
    <p>Secure Employee Login</p>

    <form>
        <div class="input-group">
            <input type="text" placeholder="Employee ID" required>
        </div>

        <div class="input-group">
            <input type="password" placeholder="Password" required>
        </div>

        <button class
