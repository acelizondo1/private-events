window.addEventListener('load', () => {
    let notice = document.querySelectorAll(".notice");
    if (notice.length > 0){
        setTimeout(function(){
            notice[0].remove();
        }, 3000);
    }
});