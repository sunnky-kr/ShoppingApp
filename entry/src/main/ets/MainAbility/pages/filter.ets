import router from '@system.router'
@Entry
@Component
struct filter
{
  private sizeScroller: Scroller=new Scroller();
  private gender: string[]=["Male","Female","Both"];
  private size :string[]=["6 inches","7 inches", "8 inches","9 inches","10 inches"];
  private colors : string[]=["#e3e3e3","#5050ff"];
  private catList: SelectOption[]=[
    {value: "Select Category"},
    {value: "Shoes"},
    {value: "Jeans"},
    {value: "Shirts"},
    {value: "Trousers"}
  ];
  private brandList: SelectOption[] = [
    {value: "Select Brand"},
    {value: "Nike"},
    {value: "Roadster"},
    {value: "HRX"}
  ];
  @State genStates : number[]=[0,0,0];
  @State sizeStates : number[]=[0,0,0,0,0];
  @State startPrice : number = 1000;
  @State endPrice : number = 10000;
  @State selectedCategory : number=0;
  @State selectedBrand :number=0;
  updateCat(index:number ,value:string)
  {
    this.selectedCategory=index;
  }
  updateBrand(index:number ,value:string)
  {
    this.selectedBrand=index;
  }
  build()
  {
    Column({space :20})
    {
      Flex({ justifyContent: FlexAlign.SpaceBetween })
      {
        Button("<").backgroundColor("#e3e3e3").fontColor(Color.Black).fontSize(30);
        Text("Filter").fontWeight(FontWeight.Bolder).fontSize(30);
        Image($r("app.media.profile")).width(50).height(30);
      };
      Text("Gender").fontSize(20).fontWeight(FontWeight.Bolder);

      Row({ space: 12 }) {
        ForEach([0,1,2],(index)=>
        {
          Button(this.gender[index]).fontSize(20).backgroundColor(this.colors[this.genStates[index]]).height(30).fontColor(Color.Black)
          .onClick(()=>
          {
            this.genStates[index]=1-this.genStates[index]
          })
        })

      }
      .height(30);

      Text("Category").fontSize(20).fontWeight(FontWeight.Bolder);
      Select(this.catList)
        .selected(this.selectedCategory)
        .width("100%")
        .height(50)
        .backgroundColor("#e3e3e3")
        .borderRadius(10)
//          .onSelect(this.updateCat)
      Text("Brand").fontSize(20).fontWeight(FontWeight.Bolder);
      Select(this.brandList)
        .selected(this.selectedBrand)
        .width("100%")
        .height(50)
        .backgroundColor("#e3e3e3")
        .borderRadius(10)
//        .onSelect(this.updateBrand)
      Text("Price").fontSize(20).fontWeight(FontWeight.Bolder);
      Flex({justifyContent:FlexAlign.SpaceBetween})
      {
        Text("₹ "+this.startPrice).fontSize(18).fontWeight(FontWeight.Bolder);
        Text("₹ "+this.endPrice).fontSize(18).fontWeight(FontWeight.Bolder);
      }
      .width("100%")
      .height(30)
      .padding(5);
      Stack() {
        Slider({
          value: 1000,
          min: 1000,
          max: 10000,
          step: 100,
          style: SliderStyle.InSet
        })
        .onChange((value,mode)=>
        {
          this.startPrice=value;
        });
        Slider({
          value: 10000,
          min: 1000,
          max: 10000,
          step: 100,
          style: SliderStyle.InSet
        }).onChange((value,mode)=>
        {
          this.endPrice=value;
        });
      };
      Text("Sizes").fontSize(20).fontWeight(FontWeight.Bolder);
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

        Button("Clear all")
        .backgroundColor("#d3d3d3")
        .borderRadius(10)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .height(40)
        .fontSize(30)
        .fontColor(Color.Black)
        .alignSelf(ItemAlign.End)
        .onClick(()=>
        {
          this.genStates=[0,0,0];
          this.sizeStates=[0,0,0,0,0];
          this.startPrice=1000;
          this.endPrice=10000;
          this.selectedBrand=0;
//          this.selectedCategory=0;
        });
        Navigator({ target: 'pages/index', type: NavigationType.Push }) {
          Button("Add")
            .backgroundColor("#d3d3d3")
            .borderRadius(10)
            .borderWidth(1)
            .borderColor(Color.Gray)
            .height(40)
            .fontSize(30)
            .fontColor(Color.Black)
            .alignSelf(ItemAlign.End);
        }.params({
          startPrice:this.startPrice,
          endPrice:this.endPrice,
          category:this.catList[this.selectedCategory]
        })
        .alignSelf(ItemAlign.End)
      }
      .height(80);


    }
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .backgroundColor("#d3d3ff")
  }
}