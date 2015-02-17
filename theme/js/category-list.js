(function () {

    'use strict';

    var categories = document.querySelector('.js-categories'),
        articleList = document.querySelector('.js-article-list'),
        showCategoriesBtn = document.querySelector('.js-show-categories'),
        closeCategoriesBtn = document.querySelector('.js-close-categories');

    function showCategories() {
        categories.classList.add('is-active');
        articleList.classList.add('is-hidden');
        window.scrollTo(0, 0);
    }

    function hideCategories() {
        categories.classList.remove('is-active');
        articleList.classList.remove('is-hidden');
    }

    if (categories && articleList && showCategoriesBtn && closeCategoriesBtn) {

        showCategoriesBtn.onclick = showCategories;
        closeCategoriesBtn.onclick = hideCategories;

        window.onkeydown = function (e) {
            if (e.keyCode === 27) {
                hideCategories();
            }
        };
    }

}());
