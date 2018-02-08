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
 * Mpa实时值显示（Left）
 */
function showMpaValueL(mpaListModelL,mpaCount) {}
/*
 * Mpa实时值显示（Right）
 */
function showMpaValueR(mpaListModelR,mpaCount) {}
/*
 * Mpa测试函数（上升）
 */
function upMpaModel(mpaListModelL,mpaListModelR,mpaCount) {
    for(var j=0;j<10;j++){
        if(mpaCount === j){
            mpaListModelL.setProperty(j,"mpa",true);
            mpaListModelR.setProperty(j,"mpa",true);
            break;
        }else{}
    }
    mpaCount++;
    return mpaCount;
}
/*
 * Mpa测试函数（下降）
 */
function downMpaModel(mpaListModelL,mpaListModelR,mpaCount) {
    for(var j=9;j>=0;j--){
        if(mpaCount === j){
            mpaListModelL.setProperty(j,"mpa",false);
            mpaListModelR.setProperty(j,"mpa",false);
            break;
        }else{}
    }
    if(mpaCount !== 0){ mpaCount-- }
    return mpaCount;
}
