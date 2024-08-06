function clearElement(){
    var articles  = document.getElementsByTagName('article');
    for (var i = 0; i < articles.length; i ++) {
        articles[i].style.display ="none";
}
}

function displayElement(className) { 
    clearElement();
    console.log(className)
    var elementToDisplay = document.getElementsByClassName(className);
    console.log(elementToDisplay)
    for (var i = 0; i < elementToDisplay.length; i ++) {
            elementToDisplay[i].style.display ="block";
    }
}
