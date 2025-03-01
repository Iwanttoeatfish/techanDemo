
import router from '@ohos.router'


@Entry
@Component
struct Index {
  @State translateY_Title: number = 200
  @State translateY_Logo: number = -200

  build() {
    Row() {
      Column() {
        Image($r("app.media.Snipaste2"))
          .height(120)
          .width(280)
          .objectFit(ImageFit.Contain)
          .translate({
            y: this.translateY_Logo
          })
          .animation({
            //播放时长（ms）
            duration: 2000,
            tempo: 1,
            curve: Curve.FastOutSlowIn,
            delay: 500,
            iterations: 1,
            playMode: PlayMode.Normal
          })

        Text('TECHAN')
          .fontSize(20)
          .textCase(TextCase.UpperCase)
          .fontWeight(FontWeight.Bold)
          .letterSpacing(10)
          .margin({
            top: 7
          })
          .translate({
            y: this.translateY_Title
          })
          .animation({
            delay: 500,
            duration: 2000,
            curve: Curve.FastOutSlowIn,
            tempo: 1,
          })
          .onAppear(() => {
            this.translateY_Logo = 0
            this.translateY_Title = 0
            let id = setInterval(() => {
              console.info('router to Second')
              //页面跳转
              router.replaceUrl({
                url: 'pages/login/LoginPage'
              })
              //定时器执行之后立即销毁
              clearInterval(id)
            }, 3000)
          })


      }
      .width('100%')
    }
    .height('100%')
  }
}