
function switchHilightItem()
{
    switch (languageIndex)
    {
        case CustomEnum.LANG_CN:
            languageIndex = CustomEnum.LANG_EN;
        break;
        case CustomEnum.LANG_EN:
            languageIndex = CustomEnum.LANG_CN;
        break;
        default:
            console.warn("Unknown Language, pls check ur code");
    }
}

// 将当前语言切换至index所指向的语言
function switchLanguage(index)
{
    // index与CarStatus.languageMode类型不匹配，用===结果返回false
    if(index == CarStatus.languageMode)
        return;

    switch (index)
    {
        case CustomEnum.LANG_CN:
            CarStatus.languageSetChanged(false); // cn
        break;
        case CustomEnum.LANG_EN:
            CarStatus.languageSetChanged(true); // en
        break;
        default:
            console.warn("Unknown Language, pls check ur code");
    }
}
