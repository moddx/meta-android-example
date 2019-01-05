//
// Created by Matthias Ervens on 29/11/18.
//

#include <vector>

#include <meta-frontend.h>
#include "frontend/cunits/MyComputeUnit.h"

using namespace std;
using namespace META::Core;
using namespace META::Frontend;

vector<DataSet> genData(int size) {
    vector<DataSet> sets(size);
    for(int i = 0; i < size; i++) {
        sets.emplace_back(i, i);
    }
    return sets;
}

int main(int argc, char **argv) {

    MyComputeUnit myComputeUnit;
    DataSource dataSource(genData(12));

    Distributor distributor(&myComputeUnit, "192.168.2.107:4300", "a4f202ec79d9be281e5e44e15ec75fa8");
    distributor.distribute(&dataSource);

    return 0;
}