#include "fbhelper.h"


#include <wait.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <stdio.h>
#include <fcntl.h>

struct mxcfb_gbl_alpha {
    int enable;
    int alpha;
};
#define MXCFB_SET_GBL_ALPHA     _IOW('F', 0x21, struct mxcfb_gbl_alpha)
//#define MXCFB_SET_LOC_ALPHA     _IOW('F', 0x26, struct mxcfb_gbl_alpha)


FbHelper::FbHelper()
{
    mFd = open("/dev/fb1", O_RDWR);
    if (mFd < 0)
    {
        perror(__func__);
        return;
    }
}

FbHelper::~FbHelper()
{
    if (mFd >= 0) {
        close(mFd);
    }
    mFd = -1;
}

void FbHelper::setFb1Alpha(int iAlpha)
{
    if (mFd < 0)
    {
        perror(__func__);
        return;
    }
    mxcfb_gbl_alpha alpha;
//     Disable global alpha since we need Pixel Alpha
    alpha.enable = 1;
    alpha.alpha = iAlpha;
    ioctl(mFd, MXCFB_SET_GBL_ALPHA, &alpha);
//    ioctl(fd_fb, MXCFB_SET_LOC_ALPHA, &alpha);
}
