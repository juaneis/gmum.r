%module cec
%{
#define SWIG_FILE_WITH_INIT
#include "cec_configuration.hpp"
#include "cec.hpp"
%}

%include "std_string.i"
%include "std_vector.i"
%include "armanpy.i"
%include <boost_shared_ptr.i>

namespace std 
{
    %template(UnsignedIntVector) vector<unsigned int>;
}

class CecConfiguration {
public:
    CecConfiguration();
    ~CecConfiguration();

    void set_dataset(arma::mat& dataset);
    void set_eps(double kill_threshold);
    void set_nclusters(unsigned int nclusters);
    void set_log_energy(bool log_energy);
    void set_log_cluster(bool log_nclusters);
    void set_nstart(unsigned int nstart);
    void set_method_init(std::string init);
    void set_method_type(std::string type);
    void set_r(double radius);
    void set_it_max(int it_max);
    void set_algorithm(std::string algorithm);
};

class CecModel {
public:
	~CecModel();
	CecModel(CecConfiguration& cfg);
	double get_energy() const;
    std::vector<unsigned int> get_assignment() const;
};
