var circle = document.querySelector('#js-circle');
new mojs.Tween({
　　repeat: 999,
　　delay: 500,
　　speed: 0.3,
　　onUpdate: function(progress) {
　　　　var bounceProgress = mojs.easing.bounce.out(progress);
　　　　circle.style.transform = 'translateY(' + 200 * bounceProgress + 'px)';
　　}
}).play();