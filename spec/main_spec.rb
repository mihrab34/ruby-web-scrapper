require_relative '../main.rb'

RSpec.describe "Watch" do
    let(:watch) { Watch.new }

    describe "#get_names" do
        it "returns products name" do
            expect(watch.get_names.class).to  be(Array)
        end 
    end

    describe "#get_titles" do
        it "returns products title" do
            expect(watch.get_titles.class).to  be(Array)
        end 
    end

    describe "#get_prices" do
        it "returns products price" do
            expect(watch.get_prices.class).to  be(Array)
        end 
    end

    describe "#output" do
        it "returns name, title and price of products" do
            expect(watch.output.class).to  be(Integer)
        end 
    end

    describe "#product_container" do
        it "returns row lists of products on the web page" do
            expect(watch.product_container.class).to  be(Nokogiri::XML::NodeSet)
        end 
    end
    
end
