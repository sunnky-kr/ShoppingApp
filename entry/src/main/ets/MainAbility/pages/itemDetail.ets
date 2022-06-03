import router from '@system.router'
@Entry
@Component
struct itemDetail {
//  @State params:any=router.getParams();
  private descriptionScroller:Scroller=new Scroller();
  private sizeScroller: Scroller=new Scroller();
  private size :string[]=["6 inches","7 inches", "8 inches","9 inches","10 inches"];
  private colors : string[]=["#e3e3e3","#5050ff"];
  @State count:number=0;
  @State sizeStates : number[]=[0,0,0,0,0];
  build()
  {
    Column({space :20}) {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Button("<").backgroundColor("#e3e3e3").fontColor(Color.Black).fontSize(30);
        Text("Detail").fontWeight(FontWeight.Bolder).fontSize(30);
        Image($r("app.media.profile")).width(50).height(30);
      };
//      Image(this.params.id).width("100%").height(320)
//      Text(this.params.name).fontSize(20).fontWeight(FontWeight.Bolder)
//      Text("₹ "+this.params.price).fontSize(20).fontWeight(FontWeight.Bolder)
      Image($r("app.media.profile")).width("100%").height(300)
      Scroll(this.descriptionScroller)
      {
        Text("Lorem ipsum dolor sit amet. Est rerum internos sed totam consequuntur ea vero asperiores et fuga numquam. Sed animi quis et quia fuga et maxime facere sed voluptatem dolor. Aut sapiente totam aut quod atque est neque adipisci ut error reprehenderit. Ut maiores dolores aut voluptate  non enim odit eum quis consequatur ut beatae voluptasEt earum velit ut omnis beatae et dolorem quae qui dolor accusantium et minima tenetur eos rerum facere. Sit deleniti reiciendis sed culpa dolor ut dolorem quia aut atque rerum ut eius placeat. Et quasi rerum ad neque necessitatibus et ullam galisum et sunt commodi aut quia ullam. Non odio obcaecati vel cumque obcaecati id modi illum et rerum galisum est reprehenderit quibusdam qui deleniti totam. Qui laborum quos et sequi eligendi et explicabo molestiae ea dolor similique! Et amet natus id explicabo omnis in quae molestiae et sint quas quo quasi tenetur sit consectetur adipisci")
          .fontColor("#a3a3a3")
          .fontSize(15);

      }
      .scrollable(ScrollDirection.Vertical)
      .height(100)
      .width("100%")
      Flex({justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center}) {
        Text("Color: ").fontSize(20);
        Radio({group: "Color", value: "Green"}).backgroundColor(Color.Green).width(5).height(5)
        Radio({group: "Color", value: "Yellow"}).backgroundColor(Color.Blue).width(5).height(5)
        Radio({group: "Color", value: "red"}).backgroundColor(Color.Red).width(5).height(5)
        Counter() {
          Text(this.count+"").fontSize(20);
        }
        .onInc(()=>
        {
          this.count=this.count+1;
        })
        .onDec(()=>
        {
          this.count=this.count-1;
          if(this.count<0)
          {
            this.count=0
          }
        })
        .backgroundColor("#6666d3")

      }
      Text("Available Sizes").fontSize(20).fontWeight(FontWeight.Bolder);
      Scroll(this.sizeScroller) {
        Row({ space: 12 }) {
          ForEach([0, 1, 2, 3, 4], (index) => {
            Button(this.size[index])
              .fontSize(20)
              .backgroundColor(this.colors[this.sizeStates[index]])
              .height(30)
              .fontColor(Color.Black)
              .onClick(() => {
                this.sizeStates[index] = 1 - this.sizeStates[index]
              })
          })

        }
      }
      .scrollable(ScrollDirection.Horizontal);
      Flex({justifyContent: FlexAlign.SpaceAround}) {
        Image($r("app.media.heart")).padding(2).height(50).width(50).borderWidth(2).borderRadius(20);
        Button(){
          Flex({justifyContent:FlexAlign.SpaceAround}) {
            Text("Add to cart").fontSize(20).fontColor(Color.White);
            Image($r("app.media.cart")).width(20).height(20);
          }
          .padding(10)
          .width("200%")
          .height(50)
          .borderRadius(10)
          .backgroundColor(Color.Blue)
        }
        .width("50%")
        .onClick(()=>
        {
          AlertDialog.show({message:"LOL"})
        })
      }
    }

    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .backgroundColor("#d3d3ff")
  }
}