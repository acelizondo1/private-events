const TABS = document.querySelectorAll("#user-tabs li");
const CONTENT = document.querySelectorAll("#user-tab-content");
const ACTIVE_CLASS = "is-active";

function initTabs() {
    TABS.forEach((tab)=> {
        tab.addEventListener('click', (e) => {
            let tab_data = tab.getAttribute('data-tab');
            updateActiveTab(tab);
            updateTabContent(tab_data);
        });
    })
}

function updateActiveTab(selected_tab) {
    let active_tab = document.querySelector("#user-tabs li.is-active");
    active_tab.classList.remove(ACTIVE_CLASS);
    selected_tab.classList.add(ACTIVE_CLASS);
}

function updateTabContent(data) {
    let active_content = document.querySelector("#user-tab-content div.is-active");
    active_content.classList.remove(ACTIVE_CLASS);
    let selected_content = document.querySelector("[data-content='" + data + "']");
    selected_content.classList.add(ACTIVE_CLASS);
}

//Timeout for site alerts
window.addEventListener('load', () => {
    let notice = document.querySelectorAll(".notice");
    if (notice.length > 0){
        setTimeout(function(){
            notice[0].remove();
        }, 3000);
    }
});


initTabs();