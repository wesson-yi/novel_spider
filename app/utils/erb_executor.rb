# 一个用于渲染ERB脚本的工具类。
#
# 被渲染的ERB脚本只能包含局部变量，局部变量可通过类的方法传递。
#
# `execute(template, params)`方法：
#
# - @template: 模板字符串
# - @params: （可选）模板内的局部变量设值，key-value对。
#

class ERBExecutor
  class << self
    def execute(template, params = {})
      b = Blank.new.blank_binding
      params.each do |key, value|
        b.local_variable_set(key, value)
      end
      ERB.new(template).result b
    end
  end

  class Blank < BasicObject
    include ::Kernel

    def blank_binding
      binding
    end
  end
end
