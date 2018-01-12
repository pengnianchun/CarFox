#ifndef FBHELPER_H
#define FBHELPER_H


class FbHelper
{
public:
    FbHelper();
    ~FbHelper();

    static FbHelper *getInstance() {
        static FbHelper * helper = new FbHelper;
        return helper;
    }

    void setFb1Alpha(int iAlpha);

private:
    int mFd;
};

#endif // FBHELPER_H
