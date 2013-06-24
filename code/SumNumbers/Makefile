all:
	rspec -f doc -o result_good.log spec/SumNumbers_spec.rb
	rspec -f doc -o result_bad.log spec/BadSumNumbers_spec.rb

clean:
	rm result_good.log result_bad.log
