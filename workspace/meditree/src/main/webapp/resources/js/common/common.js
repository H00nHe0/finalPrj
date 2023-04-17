const categories = document.querySelectorAll('.category');

categories.forEach(category => {
  category.addEventListener('click', () => {
    category.classList.toggle('active');
    const subMenu = category.nextElementSibling;
    if (subMenu.style.display === 'block') {
      subMenu.style.display = 'none';
    } else {
      subMenu.style.display = 'block';
    }
  });
});