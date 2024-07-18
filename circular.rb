class ProductFeature
  attr_reader :name, :dependent_on
  def initialize(name:, dependent_on: [])
    @name = name
    @dependent_on = dependent_on
  end

  def inspect
    dependent_on.to_s
  end
end

# Has cycle from A -> B -> C -/> A
features = [
  ProductFeature.new(name: "A", dependent_on: ["B"]),
  ProductFeature.new(name: "B", dependent_on: ["C"]),
  ProductFeature.new(name: "C", dependent_on: ["A"]),
]

feature_graph = features.each_with_object({}) do |feature, graph|
  graph[feature.name] = feature
end

puts "Now our features are in a hashtable that looks like"
puts feature_graph


