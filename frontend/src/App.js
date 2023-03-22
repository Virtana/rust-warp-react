import { Button, Flex, } from '@aws-amplify/ui-react';
import '@aws-amplify/ui-react/styles.css';

function App() {

  const handleClick = async () => {
    const response = await fetch('/name', {
      method: 'GET',
      headers: {
        Accept: 'application/json',
      },
    });

    const result = await response.json();
    console.log(JSON.stringify(result, null, 4));
  }

  return (
    <Flex
      direction={{ base: 'column', large: 'row' }}
      maxWidth="32rem"
      padding="1rem"
      width="100%"
    >
      <Flex justifyContent="space-between" direction="column">
        <Button
          variation="primary"
          onClick={() => {
            handleClick()
            alert('See console output...')}}
        >
          Hi, my name is.. 
        </Button>
      </Flex>
    </Flex>
  );
}

export default App;