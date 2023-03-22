import { Button, Flex, } from '@aws-amplify/ui-react';
import '@aws-amplify/ui-react/styles.css';

function App() {
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
          onClick={() => alert('See console output...')}
        >
          Hi, my name is.. 
        </Button>
      </Flex>
    </Flex>
  );
}

export default App;