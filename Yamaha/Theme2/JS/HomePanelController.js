/*
 * Mpa初始化函数
 */
function initializeMpaModel(mpaListModelL,mpaListModelR) {
    for(var i=0;i<10;i++){
        mpaListModelL.append({"mpa":false});
        mpaListModelR.append({"mpa":false});
    }
}
/*
 * Mpa初始化函数(Left)
 */
function initializeMpaModelL(mpaListModel) {
    for(var i=0;i<10;i++){
        mpaListModel.setProperty(i,"mpa",false);
    }
}
/*
 * Mpa初始化函数(Left)
 */
function initializeMpaModelR(mpaListModel) {
    for(var i=0;i<10;i++){
        mpaListModel.setProperty(i,"mpa",false);
    }
}
/*
 * Mpa测试函数（上升）
 */
function upMpaLeftModel(mpaListModelL,mpaIndex) {
    var index = mpaIndex;
    if(index > 0){ index-- }
    mpaListModelL.setProperty(index,"mpa",true);
}
function upMpaRightModel(mpaListModelR,mpaIndex) {
    var index = mpaIndex;
    if(index > 0){ index-- }
    mpaListModelR.setProperty(index,"mpa",true);
}
/*
 * Mpa测试函数（下降）
 */
function downMpaLeftModel(mpaListModelL,mpaIndex) {
    mpaListModelL.setProperty(mpaIndex,"mpa",false);
}
function downMpaRightModel(mpaListModelR,mpaIndex) {
    mpaListModelR.setProperty(mpaIndex,"mpa",false);
}
