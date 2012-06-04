class MainController < UITableViewController
  #attr_accessor :choices
  def viewDidLoad
    #margin = 20
    #navigationController.setNavigationBarHidden(true, animated:true)
    #footerView = UIView.alloc.initWithFrame(CGRectMake(0, 100, 280, 100))
    #new_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    #new_button.setTitle('Add New', forState:UIControlStateNormal)
    #new_button.addTarget(self, action:'addNew', forControlEvents:UIControlEventTouchUpInside)
    #new_button.frame = [[margin, 180], [view.frame.size.width - margin * 2, 40]]
    #self.view.addSubview(new_button)
    #self.navigationItem.rightBarButtonItem = self.editButtonItem;
    #tableView.tableFooterView = footerView

  end

  def viewWillAppear(animated)
    navigationItem.title = 'Choices'
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target:self, action:'addChoice')

  end


  def addChoice
    @choice_controller||= ChoicesController.alloc.init
    navigationController.pushViewController(@choice_controller, animated:true)
    @choice_controller.addChoice();
    view.reloadData
  end

  def tableView(tableView, numberOfRowsInSection:section)
    if (tableView.isEditing)
        return Choice.all.count + 1;
    else
        return Choice.all.count;
      end
  end

  def tableView(tableView,commitEditingStyle:editingStyle ,forRowAtIndexPath:indexPath)
    if(editingStyle == UITableViewCellEditingStyleDelete)
      p"========"
      Choice.all.delete_at(indexPath.row)
      p"-------------------"
  		tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation:UITableViewRowAnimationFade)
  	end
  end


  CELLID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
    end
    choice = Choice.all[indexPath.row]

    cell.textLabel.text = choice.value

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    cell = Choice.all[indexPath.row]
    @detail_controller||= ChoicesController.alloc.init
    navigationController.pushViewController(@detail_controller, animated:true)
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
    @detail_controller.editChoice(cell)
    view.reloadData
  end


end