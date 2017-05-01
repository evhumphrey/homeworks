document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.height = 500;
  canvas.width = 500;

  const ctx = canvas.getContext('2d');

  ctx.fillStyle = "blue";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 20, 0, 2 * Math.PI);
  ctx.strokeStyle = "red";
  ctx.lineWidth = 4;
  ctx.stroke();
  ctx.fillStyle = "purple";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(280, 300);
  ctx.lineTo(250, 350);
  ctx.lineTo(350, 350);
  ctx.fillStyle = "orange";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(290, 300);
  ctx.lineTo(250, 350);
  ctx.lineTo(350, 350);
  ctx.fillStyle = "pink";
  ctx.fill();

  ctx.beginPath();
  ctx.moveTo(300, 300);
  ctx.lineTo(250, 350);
  ctx.lineTo(350, 350);
  ctx.fillStyle = "green";
  ctx.fill();
});
