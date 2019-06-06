class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(request)
    return true if @default

    marker = "application/vnd.vcooline.codeevent.v#{@version}"
    request.headers['Accept'].include?(marker)
  end
end
