module ApplicationHelper
  # 根据所在的页面返回完整标题
  def full_title(page_title = '')
    base_title = '麦芽糖'
    page_title.empty? ? base_title : (page_title + ' | ' + base_title)
  end
end
