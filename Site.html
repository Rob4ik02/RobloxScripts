<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Global Script's</title>
<style>
/* Общие стили */
body {
  margin: 0;
  padding: 0;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-family: Arial, sans-serif;
  position: relative;
  background-color: #222; /* Можно оставить, если нужно */
}

/* Фоновое изображение */
.bg-image {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: url('https://usagif.com/wp-content/uploads/gif/outerspace-55.gif') no-repeat center center;
  background-size: cover;
  filter: blur(4px);
  z-index: -1;
}

/* Анимация для текста */
@keyframes colorChange {
  0% { color: rgb(31, 30, 30); }
  50% { color: gray; }
  100% { color: rgb(27, 27, 27); }
}

/* Стили для заголовка */
.header {
  position: relative;
  width: 100%;
  max-width: 600px;
  text-align: center;
  font-size: 40px;
  font-style: italic;
  font-weight: bold;
  animation: colorChange 3s infinite;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  margin-top: 20px;
}

/* Иконка */
.header img {
  width: 100px;
  height: 100px;
}

/* Форма с текстбоксами и кнопкой */
.form-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 15px;
  margin-top: 20px;
}

/* Ввод */
.form-container input {
  width: 300px;
  padding: 10px;
  font-size: 16px;
  border: 2px solid #ccc;
  border-radius: 5px;
  outline: none;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
  background-color: #f0f0f0;
}

/* Фокус */
.form-container input:focus {
  border-color: #00ff00;
  box-shadow: inset 0 0 15px #00ff00;
}

/* Кнопка */
.form-container button {
  width: 320px;
  padding: 10px;
  font-size: 18px;
  font-weight: bold;
  color: white;
  background-color: #00ff00;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
}

/* Hover на кнопку */
.form-container button:hover {
  background-color: #00cc00;
  transform: scale(1.05);
}

/* Фокус на кнопке */
.form-container button:focus {
  outline: none;
  box-shadow: inset 0 0 10px #00ff00;
}

/* Стиль для верхней строки с логином и временем */
.top-bar {
  position: absolute;
  top: 20px;
  width: 100%;
  display: flex;
  justify-content: space-between;
  padding: 0 20px;
  box-sizing: border-box;
  font-family: Arial, sans-serif;
  font-size: 16px;
  font-weight: bold;
  z-index: 10;
}

/* Общий стиль для времени и логина */
.time, .username {
  background-color: #888; /* серый фон */
  color: white;           /* белый текст */
  padding: 5px 10px;
  border-radius: 5px;
  box-shadow: inset 0 0 5px rgba(0,0,0,0.5);
}
</style>
</head>
<body>
  <!-- Фоновое изображение -->
  <div class="bg-image"></div>

  <!-- Верхняя панель для времени и логина -->
  <div class="top-bar" style="display:none;"> <!-- по умолчанию скрыта -->
    <div class="time" id="clock">00:00:00</div>
    <div class="username" id="userDisplay"></div>
  </div>

  <!-- Заголовок с иконкой -->
  <div class="header">
    <img src="https://raw.githubusercontent.com/Rob4ik02/RobloxScripts/refs/heads/main/icon.png" alt="Global Script's Icon" />
    Global Script's
  </div>

  <!-- Форма с текстбоксами и кнопкой -->
  <div class="form-container">
    <input type="text" id="login" placeholder="Login" />
    <input type="password" id="password" placeholder="Password" />
    <button id="signUpBtn">Sign Up</button>
    <div id="message" style="margin-top:10px; color: white; font-weight: bold;"></div>
  </div>

<script>
  // Пример пользователя
  const users = [
    { login: 'rob4ikyay', password: 'wowwow' },
    // Можно добавить еще пользователей
  ];

  const signUpBtn = document.getElementById('signUpBtn');
  const loginInput = document.getElementById('login');
  const passwordInput = document.getElementById('password');
  const messageDiv = document.getElementById('message');

  const clockDiv = document.getElementById('clock');
  const userDisplayDiv = document.getElementById('userDisplay');
  const topBar = document.querySelector('.top-bar');

  let currentUser = null;

  // Обновление времени по московскому времени
  function updateClock() {
    const now = new Date();
    const options = { timeZone: 'Europe/Moscow', hour12: false, hour: '2-digit', minute: '2-digit', second: '2-digit' };
    const timeString = now.toLocaleTimeString('ru-RU', options);
    clockDiv.innerText = timeString;
  }

  // Запуск таймера для обновления времени каждую секунду
  setInterval(updateClock, 1000);
  updateClock(); // первый запуск

  signUpBtn.addEventListener('click', () => {
    const login = loginInput.value.trim();
    const password = passwordInput.value;

    // Проверка наличия пользователя
    const user = users.find(u => u.login === login && u.password === password);

    if (user) {
      // Успешный вход
      currentUser = login;
      messageDiv.style.color = 'lightgreen';
      messageDiv.innerText = `Welcome, ${login}!. Main is loading...`;
      // Отображаем имя пользователя и время
      userDisplayDiv.innerText = login;
      document.querySelector('.top-bar').style.display = 'flex';
    } else {
      // Неудача
      messageDiv.style.color = 'red';
      messageDiv.innerText = 'Please check your login and password. 3 attempts left.';
    }
  });
</script>
</body>
</html>
