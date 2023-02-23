CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo 'File Found'
else 
    echo 'Need ListExamples.java'
    exit 1
fi 
cp ../TestListExamples.java TestListExamples.java
cp -r ../lib lib
echo 'files copied'
javac -cp $CPATH *.java
echo 'file compilied'
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > result.txt
echo 'test complete'
grep -h 'Tests run' result.txt > resultFail.txt 
grep -h 'OK' result.txt > resultPass.txt
cat resultFail.txt resultPass.txt > output.txt
cat output.txt