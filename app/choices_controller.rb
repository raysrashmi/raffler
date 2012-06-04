class ChoicesController < UIViewController

  def viewDidLoad
    navigationController.setNavigationBarHidden(false, animated:true)
    navigationItem.title = 'Edit Choice'
  end

  def editChoice(choice)
    @choice = choice
    choiceForm(choice)
    @text_field.text = choice.value
    @label.text = choice.value
  end

  def  saveChoice
    if @choice
      @choice.value = @text_field.text
      @choice.save
    else
      Choice.create(:value => @text_field.text )
    end

    @root_controller = MainController.alloc.init
    navigationController.pushViewController(@root_controller, animated:true)
  end

  def addChoice
    choiceForm
  end

  def choiceForm(choice='')
    margin = 20
    self.view.backgroundColor = UIColor.whiteColor
    @text_field = UITextField.alloc.init
    @text_field.frame = [[margin, 40], [view.frame.size.width - margin * 2, 40]]
    @text_field.borderStyle  =UITextBorderStyleRoundedRect
    @label = UILabel.alloc.init

    @saveButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @saveButton.setTitle('Save', forState:UIControlStateNormal)
    @saveButton.addTarget(self, action:'saveChoice', forControlEvents:UIControlEventTouchUpInside)
    @saveButton.frame = [[margin, 180], [view.frame.size.width - margin * 2, 40]]

    view.addSubview(@text_field)
    view.addSubview(@label)
    view.addSubview(@saveButton)
  end




end